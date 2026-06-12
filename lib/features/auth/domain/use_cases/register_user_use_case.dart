import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/features/auth/data/auth_repository.dart';
import 'package:test_flutter_template/features/auth/domain/models/auth_session.dart';

class RegisterUserUseCase {
  final AuthRepository _repository;

  RegisterUserUseCase(this._repository);

  Future<Result<AuthSession>> execute({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) {
    return _repository.register(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
