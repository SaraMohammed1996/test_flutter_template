import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/core/presentation/providers/base_notifier.dart';
import 'package:test_flutter_template/core/presentation/providers/base_state.dart';
import 'package:test_flutter_template/features/auth/domain/models/user.dart';
import 'package:test_flutter_template/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:test_flutter_template/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:test_flutter_template/features/profile/presentation/providers/profile_provider.dart';

class ProfileNotifier extends BaseNotifier<User> {
  final Ref _ref;

  ProfileNotifier(this._ref);

  @override
  Future<Result<User>> fetchData({Map<String, dynamic>? params}) async {
    final GetProfileUseCase useCase =
        await _ref.read(getProfileUseCaseProvider.future);
    return useCase.execute();
  }

  Future<void> loadProfile() {
    return load();
  }

  Future<Result<User>> updateName(String name) async {
    final UpdateProfileUseCase useCase =
        await _ref.read(updateProfileUseCaseProvider.future);
    final Result<User> result = await useCase.execute(name: name);

    switch (result) {
      case Success<User>(:final data):
        state = BaseState.loaded(data);
      case Failure<User>():
        break;
    }

    return result;
  }
}

final profileDataProvider =
    StateNotifierProvider<ProfileNotifier, BaseState<User>>((ref) {
  return ProfileNotifier(ref);
});
