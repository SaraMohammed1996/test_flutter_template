import 'package:chopper/chopper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter_template/core/api/api_client.dart';
import 'package:test_flutter_template/core/config/api_config_repository.dart';
import 'package:test_flutter_template/core/storage/token_storage.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((Ref ref) {
  throw StateError(
    'SharedPreferences must be initialized in main() and overridden.',
  );
});

final apiConfigRepositoryProvider = Provider<ApiConfigRepository>((ref) {
  return const ApiConfigRepository();
});

final apiBaseUrlProvider = FutureProvider<String>((ref) async {
  final repository = ref.watch(apiConfigRepositoryProvider);
  return repository.getBaseUrl();
});

final apiConfigStreamProvider = StreamProvider<Map<String, String>>((ref) {
  final repository = ref.watch(apiConfigRepositoryProvider);
  return repository.watchConfig();
});

final apiClientProvider = FutureProvider<ChopperClient>((ref) async {
  final baseUrl = await ref.watch(apiBaseUrlProvider.future);
  return ApiClient.create(baseUrl: baseUrl);
});

final tokenStorageProvider = Provider<TokenStorage>((ref) {
  final SharedPreferences prefs = ref.watch(sharedPreferencesProvider);
  return TokenStorage(prefs);
});


