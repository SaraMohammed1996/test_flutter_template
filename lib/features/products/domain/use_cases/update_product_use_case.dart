import 'dart:io';

import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/features/products/data/products_repository.dart';
import 'package:test_flutter_template/features/products/domain/models/product.dart';

class UpdateProductUseCase {
  final ProductsRepository _repository;

  UpdateProductUseCase(this._repository);

  Future<Result<Product>> execute({
    required int id,
    String? name,
    String? description,
    double? price,
    int? quantity,
    File? imageFile,
  }) {
    return _repository.updateProduct(
      id: id,
      name: name,
      description: description,
      price: price,
      quantity: quantity,
      imageFile: imageFile,
    );
  }
}
