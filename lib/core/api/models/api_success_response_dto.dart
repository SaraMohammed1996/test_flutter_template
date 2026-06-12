import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_success_response_dto.g.dart';

abstract class ApiSuccessResponseDto
    implements Built<ApiSuccessResponseDto, ApiSuccessResponseDtoBuilder> {
  bool get success;
  String? get message;

  ApiSuccessResponseDto._();
  factory ApiSuccessResponseDto(
          [void Function(ApiSuccessResponseDtoBuilder) updates]) =
      _$ApiSuccessResponseDto;

  static Serializer<ApiSuccessResponseDto> get serializer =>
      _$apiSuccessResponseDtoSerializer;
}
