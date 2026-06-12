import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:test_flutter_template/features/auth/data/models/auth_response_dto.dart';
import 'package:test_flutter_template/features/auth/domain/models/auth_session.dart';

part 'auth_api_response_dto.g.dart';

/// API wrapper for login/register responses:
/// `{ "success": true, "message": "...", "data": { user, token, token_type } }`
abstract class AuthApiResponseDto
    implements Built<AuthApiResponseDto, AuthApiResponseDtoBuilder> {
  bool get success;
  String? get message;
  AuthResponseDto get data;

  AuthApiResponseDto._();
  factory AuthApiResponseDto([void Function(AuthApiResponseDtoBuilder) updates]) =
      _$AuthApiResponseDto;

  static Serializer<AuthApiResponseDto> get serializer =>
      _$authApiResponseDtoSerializer;

  AuthSession toDomain() => data.toDomain();
}
