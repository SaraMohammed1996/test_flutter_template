import 'package:chopper/chopper.dart';
import 'package:test_flutter_template/core/api/models/api_success_response_dto.dart';
import 'package:test_flutter_template/features/auth/data/models/auth_api_response_dto.dart';
import 'package:test_flutter_template/features/auth/data/models/login_request_dto.dart';
import 'package:test_flutter_template/features/auth/data/models/register_request_dto.dart';

part 'auth_service.chopper.dart';

@ChopperApi()
abstract class AuthService extends ChopperService {
  static AuthService create([ChopperClient? client]) => _$AuthService(client);

  @POST(path: '/register')
  Future<Response<AuthApiResponseDto>> register(@Body() RegisterRequestDto body);

  @POST(path: '/login')
  Future<Response<AuthApiResponseDto>> login(@Body() LoginRequestDto body);

  @POST(path: '/logout')
  Future<Response<ApiSuccessResponseDto>> logout();
}
