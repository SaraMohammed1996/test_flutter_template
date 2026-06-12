import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/features/auth/data/auth_repository.dart';

class LogoutUserUseCase {
  final AuthRepository _repository;

  LogoutUserUseCase(this._repository);

  Future<Result<void>> execute() {
    return _repository.logout();
  }
}
