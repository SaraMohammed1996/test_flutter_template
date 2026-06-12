import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter_template/core/storage/token_storage.dart';

class AuthInterceptor implements Interceptor {
  static TokenStorage? _tokenStorage;

  // Callback to notify when token is invalid (401 error)
  // Receives GoRouter to allow explicit navigation and stack clearing
  static void Function(GoRouter)? onTokenExpired;

  // Store router reference for use when token expires before request
  static GoRouter? _router;

  /// Set the router reference for use in token expiry handling
  static void setRouter(GoRouter router) {
    _router = router;
  }

  /// Configure a shared [TokenStorage] instance for token reads/writes.
  static void configure(TokenStorage tokenStorage) {
    _tokenStorage = tokenStorage;
  }

  static Future<TokenStorage> _storage() async {
    if (_tokenStorage != null) {
      return _tokenStorage!;
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return TokenStorage(prefs);
  }

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    final TokenStorage storage = await _storage();
    final String? token = await storage.getToken();
    final Request request = chain.request;

    if (await storage.isTokenExpired()) {
      await storage.clearToken();
      if (_router != null) {
        onTokenExpired?.call(_router!);
      }
      return chain.proceed(request);
    }

    if (token != null && token.isNotEmpty) {
      final Map<String, String> updatedHeaders =
          Map<String, String>.from(request.headers);
      updatedHeaders['Authorization'] = 'Bearer $token';
      final Request updatedRequest = request.copyWith(headers: updatedHeaders);

      final Response<BodyType> response = await chain.proceed(updatedRequest);

      if (response.statusCode == 401) {
        await storage.clearToken();
        if (_router != null) {
          onTokenExpired?.call(_router!);
        }
      }

      return response;
    }

    return chain.proceed(request);
  }

  /// Save token with optional expiry duration.
  /// If no duration is provided, token is considered non-expiring.
  static Future<void> saveToken(String token, {Duration? expiresIn}) async {
    final TokenStorage storage = await _storage();
    await storage.saveToken(token, expiresIn: expiresIn);
  }

  static Future<void> clearToken() async {
    final TokenStorage storage = await _storage();
    await storage.clearToken();
  }

  static Future<String?> getToken() async {
    final TokenStorage storage = await _storage();
    return storage.getToken();
  }
}
