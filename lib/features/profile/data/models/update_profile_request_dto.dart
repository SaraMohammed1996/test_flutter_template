import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_profile_request_dto.g.dart';

abstract class UpdateProfileRequestDto
    implements Built<UpdateProfileRequestDto, UpdateProfileRequestDtoBuilder> {
  String? get name;
  String? get email;

  UpdateProfileRequestDto._();
  factory UpdateProfileRequestDto(
          [void Function(UpdateProfileRequestDtoBuilder) updates]) =
      _$UpdateProfileRequestDto;

  static Serializer<UpdateProfileRequestDto> get serializer =>
      _$updateProfileRequestDtoSerializer;
}
