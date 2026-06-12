import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_request_dto.g.dart';

abstract class RegisterRequestDto
    implements Built<RegisterRequestDto, RegisterRequestDtoBuilder> {
  String get email;
  String get password;
  @BuiltValueField(wireName: 'password_confirmation')
  String get passwordConfirmation;
  String get name;

  RegisterRequestDto._();
  factory RegisterRequestDto([void Function(RegisterRequestDtoBuilder) updates]) =
      _$RegisterRequestDto;

  static Serializer<RegisterRequestDto> get serializer =>
      _$registerRequestDtoSerializer;
}
