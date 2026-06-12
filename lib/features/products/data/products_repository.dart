import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:test_flutter_template/core/api/errors/api_errors.dart';
import 'package:test_flutter_template/core/api/services/products_service.dart';
import 'package:test_flutter_template/core/domain/paginated_list.dart';
import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/features/products/data/models/create_product_request_dto.dart';
import 'package:test_flutter_template/features/products/data/models/product_dto.dart';
import 'package:test_flutter_template/features/products/data/models/update_product_request_dto.dart';
import 'package:test_flutter_template/features/products/domain/models/product.dart';

class ProductsRepository {
  final ProductsService _service;

  ProductsRepository(this._service);

  Future<Result<PaginatedList<Product>>> getProducts({
    String? search,
    int page = 1,
  }) async {
    try {
      final response = await _service.getProducts(
        search: search,
        page: page,
      );

      if (response.isSuccessful && response.body != null) {
        return Success(response.body!.toDomain());
      }

      return const Failure(message: 'Failed to load products');
    } on ResponseValidationError catch (e) {
      return Failure(message: e.message, code: e.code, data: e.data);
    } on ResponseError catch (e) {
      return Failure(
        message: e.message ?? 'Failed to load products',
        code: e.code,
      );
    } on SocketException {
      return const Failure(
        message: 'No internet connection',
        code: 'NETWORK_ERROR',
      );
    } catch (e) {
      return Failure(message: e.toString());
    }
  }

  Future<Result<Product>> createProduct({
    required String name,
    String? description,
    required double price,
    required int quantity,
    File? imageFile,
  }) async {
    try {
      final Response<ProductDto> response;
      if (imageFile != null) {
        response = await _service.createProductMultipart(
          name: name,
          description: description,
          price: price.toStringAsFixed(2),
          quantity: quantity.toString(),
          image: imageFile.path,
        );
      } else {
        response = await _service.createProduct(
          CreateProductRequestDto(
            (CreateProductRequestDtoBuilder builder) => builder
              ..name = name
              ..description = description
              ..price = price
              ..quantity = quantity,
          ),
        );
      }

      if (response.isSuccessful && response.body != null) {
        return Success(response.body!.toDomain());
      }

      return const Failure(message: 'Failed to create product');
    } on ResponseValidationError catch (e) {
      return Failure(message: e.message, code: e.code, data: e.data);
    } on ResponseError catch (e) {
      return Failure(
        message: e.message ?? 'Failed to create product',
        code: e.code,
      );
    } on SocketException {
      return const Failure(
        message: 'No internet connection',
        code: 'NETWORK_ERROR',
      );
    } catch (e) {
      return Failure(message: e.toString());
    }
  }

  Future<Result<Product>> updateProduct({
    required int id,
    String? name,
    String? description,
    double? price,
    int? quantity,
    File? imageFile,
  }) async {
    try {
      final Response<ProductDto> response;
      if (imageFile != null) {
        response = await _service.updateProductMultipart(
          id,
          name: name ?? '',
          description: description,
          price: (price ?? 0).toStringAsFixed(2),
          quantity: (quantity ?? 0).toString(),
          image: imageFile.path,
        );
      } else {
        response = await _service.updateProduct(
          id,
          UpdateProductRequestDto(
            (UpdateProductRequestDtoBuilder builder) => builder
              ..name = name
              ..description = description
              ..price = price
              ..quantity = quantity,
          ),
        );
      }

      if (response.isSuccessful && response.body != null) {
        return Success(response.body!.toDomain());
      }

      return const Failure(message: 'Failed to update product');
    } on ResponseValidationError catch (e) {
      return Failure(message: e.message, code: e.code, data: e.data);
    } on ResponseError catch (e) {
      return Failure(
        message: e.message ?? 'Failed to update product',
        code: e.code,
      );
    } on SocketException {
      return const Failure(
        message: 'No internet connection',
        code: 'NETWORK_ERROR',
      );
    } catch (e) {
      return Failure(message: e.toString());
    }
  }

  Future<Result<void>> deleteProduct(int id) async {
    try {
      final response = await _service.deleteProduct(id);

      if (response.isSuccessful) {
        return const Success(null);
      }

      return const Failure(message: 'Failed to delete product');
    } on ResponseValidationError catch (e) {
      return Failure(message: e.message, code: e.code, data: e.data);
    } on ResponseError catch (e) {
      return Failure(
        message: e.message ?? 'Failed to delete product',
        code: e.code,
      );
    } on SocketException {
      return const Failure(
        message: 'No internet connection',
        code: 'NETWORK_ERROR',
      );
    } catch (e) {
      return Failure(message: e.toString());
    }
  }
}
