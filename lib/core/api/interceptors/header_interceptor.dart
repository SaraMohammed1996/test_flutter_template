import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderInterceptor implements Interceptor {
  static const String defaultLang = 'ar';
  static const String _localeKey = 'app_locale';

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    final request = chain.request;
    final updatedHeaders = Map<String, String>.from(request.headers);

    updatedHeaders['accept'] = 'application/json';

    final updatedRequest = request.copyWith(headers: updatedHeaders);
    return chain.proceed(updatedRequest);
  }

  /// Get the user's selected language from SharedPreferences
  /// Falls back to defaultLang if not found
  Future<String> _getSelectedLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_localeKey) ?? defaultLang;
    } catch (e) {
      return defaultLang;
    }
  }
}
