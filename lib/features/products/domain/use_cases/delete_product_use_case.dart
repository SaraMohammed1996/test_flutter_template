import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/features/products/data/products_repository.dart';

class DeleteProductUseCase {
  final ProductsRepository _repository;

  DeleteProductUseCase(this._repository);

  Future<Result<void>> execute(int id) {
    return _repository.deleteProduct(id);
  }
}
