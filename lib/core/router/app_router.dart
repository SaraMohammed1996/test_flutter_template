import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter_template/core/api/interceptors/auth_interceptor.dart';
import 'package:test_flutter_template/features/auth/presentation/providers/auth_provider.dart';
import 'package:test_flutter_template/features/auth/presentation/providers/auth_state.dart';
import 'package:test_flutter_template/features/auth/presentation/screens/login_screen.dart';
import 'package:test_flutter_template/features/auth/presentation/screens/register_screen.dart';
import 'package:test_flutter_template/features/home/presentation/screens/home_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final AuthNotifier authNotifier = ref.watch(authProvider.notifier);

  final GoRouter router = GoRouter(
    initialLocation: '/login',
    refreshListenable: authNotifier.refreshListener,
    redirect: (BuildContext context, GoRouterState state) {
      final AuthState authState = ref.read(authProvider);
      final String location = state.matchedLocation;
      final bool isAuthRoute =
          location == '/login' || location == '/register';
      final bool isHomeRoute = location == '/home';

      return authState.when(
        initial: () => null,
        loading: () => isAuthRoute ? null : null,
        authenticated: (_) {
          if (isAuthRoute) {
            return '/home';
          }
          return null;
        },
        unauthenticated: () {
          if (isHomeRoute) {
            return '/login';
          }
          return null;
        },
        error: (_) => null,
      );
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterScreen();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
    ],
  );

  AuthInterceptor.setRouter(router);
  AuthInterceptor.onTokenExpired = (GoRouter expiredRouter) {
    ref.read(authProvider.notifier).sessionExpired();
    expiredRouter.go('/login');
  };

  ref.onDispose(router.dispose);

  return router;
});
