import 'package:chopper/chopper.dart';
import 'package:test_flutter_template/core/api/converters/built_value_converter.dart';
import 'package:test_flutter_template/core/api/interceptors/auth_interceptor.dart';
import 'package:test_flutter_template/core/api/interceptors/header_interceptor.dart';
import 'package:test_flutter_template/core/api/services/auth_service.dart';
import 'package:test_flutter_template/core/api/services/products_service.dart';
import 'package:test_flutter_template/core/api/services/profile_service.dart';

class ApiClient {
  static ChopperClient create({
    String? baseUrl,
  }) {
    final converter = BuiltValueConverter();

    if (baseUrl == null || baseUrl.isEmpty) {
      throw Exception(
        'Base URL is required. Subdomain must be set before creating API client.',
      );
    }

    return ChopperClient(
      baseUrl: Uri.parse(baseUrl),
      services: [
        AuthService.create(),
        ProductsService.create(),
        ProfileService.create(),
      ],
      converter: converter,
      errorConverter: converter,
      interceptors: [
        AuthInterceptor(),
        HeaderInterceptor(),
        HttpLoggingInterceptor(),
      ],
    );
  }
}
