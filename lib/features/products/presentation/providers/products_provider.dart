import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_template/core/api/services/products_service.dart';
import 'package:test_flutter_template/core/providers/api_config_provider.dart';
import 'package:test_flutter_template/features/products/data/products_repository.dart';
import 'package:test_flutter_template/features/products/domain/use_cases/create_product_use_case.dart';
import 'package:test_flutter_template/features/products/domain/use_cases/delete_product_use_case.dart';
import 'package:test_flutter_template/features/products/domain/use_cases/get_products_use_case.dart';
import 'package:test_flutter_template/features/products/domain/use_cases/update_product_use_case.dart';

final productsServiceProvider = FutureProvider<ProductsService>((ref) async {
  final client = await ref.watch(apiClientProvider.future);
  return client.getService<ProductsService>();
});

final productsRepositoryProvider = FutureProvider<ProductsRepository>((ref) async {
  final service = await ref.watch(productsServiceProvider.future);
  return ProductsRepository(service);
});

final getProductsUseCaseProvider = FutureProvider<GetProductsUseCase>((ref) async {
  final repository = await ref.watch(productsRepositoryProvider.future);
  return GetProductsUseCase(repository);
});

final createProductUseCaseProvider =
    FutureProvider<CreateProductUseCase>((ref) async {
  final repository = await ref.watch(productsRepositoryProvider.future);
  return CreateProductUseCase(repository);
});

final updateProductUseCaseProvider =
    FutureProvider<UpdateProductUseCase>((ref) async {
  final repository = await ref.watch(productsRepositoryProvider.future);
  return UpdateProductUseCase(repository);
});

final deleteProductUseCaseProvider =
    FutureProvider<DeleteProductUseCase>((ref) async {
  final repository = await ref.watch(productsRepositoryProvider.future);
  return DeleteProductUseCase(repository);
});
