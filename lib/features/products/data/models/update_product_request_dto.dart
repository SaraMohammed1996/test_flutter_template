import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_product_request_dto.g.dart';

abstract class UpdateProductRequestDto
    implements Built<UpdateProductRequestDto, UpdateProductRequestDtoBuilder> {
  String? get name;
  String? get description;
  double? get price;
  int? get quantity;
  String? get image;

  UpdateProductRequestDto._();
  factory UpdateProductRequestDto(
          [void Function(UpdateProductRequestDtoBuilder) updates]) =
      _$UpdateProductRequestDto;

  static Serializer<UpdateProductRequestDto> get serializer =>
      _$updateProductRequestDtoSerializer;
}
