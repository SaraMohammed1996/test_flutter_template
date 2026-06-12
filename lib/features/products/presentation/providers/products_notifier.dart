import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_template/core/domain/paginated_list.dart';
import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/core/presentation/providers/paginated_notifier.dart';
import 'package:test_flutter_template/core/presentation/providers/paginated_state.dart';
import 'package:test_flutter_template/features/products/domain/models/product.dart';
import 'package:test_flutter_template/features/products/domain/use_cases/delete_product_use_case.dart';
import 'package:test_flutter_template/features/products/domain/use_cases/get_products_use_case.dart';
import 'package:test_flutter_template/features/products/presentation/providers/products_provider.dart';

class ProductsNotifier extends PaginatedNotifier<Product> {
  final Ref _ref;

  ProductsNotifier(this._ref);

  String? _search;

  Map<String, dynamic>? get _searchParams =>
      _search != null ? {'search': _search} : null;

  @override
  Future<Result<PaginatedList<Product>>> fetchPage({
    required int page,
    Map<String, dynamic>? params,
  }) async {
    final GetProductsUseCase useCase =
        await _ref.read(getProductsUseCaseProvider.future);
    return useCase.execute(
      search: params?['search'] as String?,
      page: page,
    );
  }

  Future<void> loadProducts() {
    return load(params: _searchParams);
  }

  Future<void> searchProducts(String? query) {
    final String trimmedQuery = query?.trim() ?? '';
    _search = trimmedQuery.isEmpty ? null : trimmedQuery;
    return load(params: _searchParams);
  }

  Future<void> loadMoreProducts() {
    return loadMore(params: _searchParams);
  }

  Future<Result<void>> deleteProduct(int id) async {
    final DeleteProductUseCase useCase =
        await _ref.read(deleteProductUseCaseProvider.future);
    final Result<void> result = await useCase.execute(id);

    switch (result) {
      case Success<void>():
        _removeProductFromState(id);
      case Failure<void>():
        break;
    }

    return result;
  }

  void _removeProductFromState(int id) {
    state = state.maybeWhen(
      loaded: (PaginatedList<Product> data) {
        final List<Product> updatedItems =
            data.items.where((Product product) => product.id != id).toList();
        return PaginatedState.loaded(
          data.copyWith(
            items: updatedItems,
            total: data.total > 0 ? data.total - 1 : 0,
          ),
        );
      },
      loadingMore: (PaginatedList<Product> data) {
        final List<Product> updatedItems =
            data.items.where((Product product) => product.id != id).toList();
        return PaginatedState.loaded(
          data.copyWith(
            items: updatedItems,
            total: data.total > 0 ? data.total - 1 : 0,
          ),
        );
      },
      orElse: () => state,
    );
  }
}

final productsListProvider =
    StateNotifierProvider<ProductsNotifier, PaginatedState<Product>>((ref) {
  return ProductsNotifier(ref);
});
