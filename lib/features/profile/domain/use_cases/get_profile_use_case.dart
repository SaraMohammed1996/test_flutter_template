import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/features/auth/domain/models/user.dart';
import 'package:test_flutter_template/features/profile/data/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository _repository;

  GetProfileUseCase(this._repository);

  Future<Result<User>> execute() {
    return _repository.getProfile();
  }
}
