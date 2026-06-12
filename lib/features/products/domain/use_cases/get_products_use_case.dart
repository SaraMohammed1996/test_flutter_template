import 'package:test_flutter_template/core/domain/paginated_list.dart';
import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/features/products/data/products_repository.dart';
import 'package:test_flutter_template/features/products/domain/models/product.dart';

class GetProductsUseCase {
  final ProductsRepository _repository;

  GetProductsUseCase(this._repository);

  Future<Result<PaginatedList<Product>>> execute({
    String? search,
    int page = 1,
  }) {
    return _repository.getProducts(search: search, page: page);
  }
}
