import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/features/auth/domain/models/user.dart';
import 'package:test_flutter_template/features/profile/data/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository _repository;

  UpdateProfileUseCase(this._repository);

  Future<Result<User>> execute({
    String? name,
    String? email,
  }) {
    return _repository.updateProfile(name: name, email: email);
  }
}
