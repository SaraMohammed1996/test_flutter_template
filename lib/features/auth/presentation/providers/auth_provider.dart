import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_template/core/api/services/auth_service.dart';
import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/core/providers/api_config_provider.dart';
import 'package:test_flutter_template/features/auth/data/auth_repository.dart';
import 'package:test_flutter_template/features/auth/domain/models/auth_session.dart';
import 'package:test_flutter_template/features/auth/domain/models/user.dart';
import 'package:test_flutter_template/features/auth/domain/use_cases/login_user_use_case.dart';
import 'package:test_flutter_template/features/auth/domain/use_cases/logout_user_use_case.dart';
import 'package:test_flutter_template/features/auth/domain/use_cases/register_user_use_case.dart';
import 'package:test_flutter_template/features/auth/presentation/providers/auth_state.dart';

final authServiceProvider = FutureProvider<AuthService>((ref) async {
  final client = await ref.watch(apiClientProvider.future);
  return client.getService<AuthService>();
});

final authRepositoryProvider = FutureProvider<AuthRepository>((ref) async {
  final service = await ref.watch(authServiceProvider.future);
  final tokenStorage = ref.watch(tokenStorageProvider);
  return AuthRepository(service, tokenStorage);
});

final loginUserUseCaseProvider = FutureProvider<LoginUserUseCase>((ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return LoginUserUseCase(repository);
});

final registerUserUseCaseProvider =
    FutureProvider<RegisterUserUseCase>((ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return RegisterUserUseCase(repository);
});

final logoutUserUseCaseProvider = FutureProvider<LogoutUserUseCase>((ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return LogoutUserUseCase(repository);
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});

class RouterRefreshNotifier extends ChangeNotifier {
  void refresh() => notifyListeners();
}

final routerRefreshProvider = Provider<RouterRefreshNotifier>((ref) {
  final RouterRefreshNotifier notifier = RouterRefreshNotifier();
  ref.onDispose(notifier.dispose);
  return notifier;
});

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref _ref;

  AuthNotifier(this._ref) : super(const AuthState.initial()) {
    checkAuthStatus();
  }

  RouterRefreshNotifier get refreshListener => _ref.read(routerRefreshProvider);

  @override
  set state(AuthState value) {
    super.state = value;
    refreshListener.refresh();
  }

  Future<void> checkAuthStatus() async {
    state = const AuthState.loading();

    final tokenStorage = _ref.read(tokenStorageProvider);
    final String? token = await tokenStorage.getToken();
    final bool isExpired = await tokenStorage.isTokenExpired();

    if (token == null || token.isEmpty || isExpired) {
      if (isExpired) {
        await tokenStorage.clearToken();
      }
      state = const AuthState.unauthenticated();
      return;
    }

    state = const AuthState.authenticated(
      User(id: 0, name: '', email: ''),
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();

    try {
      final LoginUserUseCase useCase =
          await _ref.read(loginUserUseCaseProvider.future);
      final Result<AuthSession> result = await useCase.execute(
        email: email,
        password: password,
      );

      switch (result) {
        case Success<AuthSession>(:final data):
          state = AuthState.authenticated(data.user);
        case Failure<AuthSession>(:final message):
          state = AuthState.error(message);
      }
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    state = const AuthState.loading();

    try {
      final RegisterUserUseCase useCase =
          await _ref.read(registerUserUseCaseProvider.future);
      final Result<AuthSession> result = await useCase.execute(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );

      switch (result) {
        case Success<AuthSession>(:final data):
          state = AuthState.authenticated(data.user);
        case Failure<AuthSession>(:final message):
          state = AuthState.error(message);
      }
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      final LogoutUserUseCase useCase =
          await _ref.read(logoutUserUseCaseProvider.future);
      await useCase.execute();
    } catch (_) {
      await _ref.read(tokenStorageProvider).clearToken();
    }

    state = const AuthState.unauthenticated();
  }

  Future<void> sessionExpired() async {
    await _ref.read(tokenStorageProvider).clearToken();
    state = const AuthState.unauthenticated();
  }

  void updateUser(User user) {
    state.maybeWhen(
      authenticated: (_) => state = AuthState.authenticated(user),
      orElse: () {},
    );
  }
}
