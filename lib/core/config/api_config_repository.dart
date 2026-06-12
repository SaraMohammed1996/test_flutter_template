import 'package:logging/logging.dart';

/// Repository for managing API configuration.
class ApiConfigRepository {
  static final Logger _logger = Logger('ApiConfigRepository');

  static const String _defaultBaseUrl =
      'http://localhost/laravel-api-dashboard/public/api/v1';

  const ApiConfigRepository();

  Future<String> getBaseUrl() async {
    _logger.fine('API base URL resolved from defaults');
    return _defaultBaseUrl;
  }

  Map<String, String> _buildConfig() {
    return {'baseUrl': _defaultBaseUrl};
  }

  Stream<Map<String, String>> watchConfig() {
    return Stream.value(_buildConfig());
  }
}
