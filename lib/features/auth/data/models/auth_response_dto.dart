import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:test_flutter_template/features/auth/data/models/user_dto.dart';
import 'package:test_flutter_template/features/auth/domain/models/auth_session.dart';

part 'auth_response_dto.g.dart';

abstract class AuthResponseDto
    implements Built<AuthResponseDto, AuthResponseDtoBuilder> {
  UserDto get user;
  String get token;
  @BuiltValueField(wireName: 'token_type')
  String? get tokenType;

  AuthResponseDto._();
  factory AuthResponseDto([void Function(AuthResponseDtoBuilder) updates]) =
      _$AuthResponseDto;

  static Serializer<AuthResponseDto> get serializer =>
      _$authResponseDtoSerializer;

  AuthSession toDomain() => AuthSession(token: token, user: user.toDomain());
}
