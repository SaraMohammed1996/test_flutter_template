import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_request_dto.g.dart';

abstract class LoginRequestDto
    implements Built<LoginRequestDto, LoginRequestDtoBuilder> {
  String get email;
  String get password;

  LoginRequestDto._();
  factory LoginRequestDto([void Function(LoginRequestDtoBuilder) updates]) =
      _$LoginRequestDto;

  static Serializer<LoginRequestDto> get serializer =>
      _$loginRequestDtoSerializer;
}
