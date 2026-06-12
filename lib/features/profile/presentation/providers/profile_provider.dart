import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_template/core/api/services/profile_service.dart';
import 'package:test_flutter_template/core/providers/api_config_provider.dart';
import 'package:test_flutter_template/features/profile/data/profile_repository.dart';
import 'package:test_flutter_template/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:test_flutter_template/features/profile/domain/use_cases/update_profile_use_case.dart';

final profileServiceProvider = FutureProvider<ProfileService>((ref) async {
  final client = await ref.watch(apiClientProvider.future);
  return client.getService<ProfileService>();
});

final profileRepositoryProvider = FutureProvider<ProfileRepository>((ref) async {
  final service = await ref.watch(profileServiceProvider.future);
  return ProfileRepository(service);
});

final getProfileUseCaseProvider = FutureProvider<GetProfileUseCase>((ref) async {
  final repository = await ref.watch(profileRepositoryProvider.future);
  return GetProfileUseCase(repository);
});

final updateProfileUseCaseProvider =
    FutureProvider<UpdateProfileUseCase>((ref) async {
  final repository = await ref.watch(profileRepositoryProvider.future);
  return UpdateProfileUseCase(repository);
});
