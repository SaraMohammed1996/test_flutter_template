import 'dart:io';

import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/features/products/data/products_repository.dart';
import 'package:test_flutter_template/features/products/domain/models/product.dart';

class CreateProductUseCase {
  final ProductsRepository _repository;

  CreateProductUseCase(this._repository);

  Future<Result<Product>> execute({
    required String name,
    String? description,
    required double price,
    required int quantity,
    File? imageFile,
  }) {
    return _repository.createProduct(
      name: name,
      description: description,
      price: price,
      quantity: quantity,
      imageFile: imageFile,
    );
  }
}
