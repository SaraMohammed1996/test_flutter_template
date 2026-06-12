import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/features/auth/data/auth_repository.dart';
import 'package:test_flutter_template/features/auth/domain/models/auth_session.dart';

class LoginUserUseCase {
  final AuthRepository _repository;

  LoginUserUseCase(this._repository);

  Future<Result<AuthSession>> execute({
    required String email,
    required String password,
  }) {
    return _repository.login(email: email, password: password);
  }
}
