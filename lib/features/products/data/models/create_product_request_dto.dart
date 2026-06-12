import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_product_request_dto.g.dart';

abstract class CreateProductRequestDto
    implements Built<CreateProductRequestDto, CreateProductRequestDtoBuilder> {
  String get name;
  String? get description;
  double get price;
  int get quantity;
  String? get image;

  CreateProductRequestDto._();
  factory CreateProductRequestDto(
          [void Function(CreateProductRequestDtoBuilder) updates]) =
      _$CreateProductRequestDto;

  static Serializer<CreateProductRequestDto> get serializer =>
      _$createProductRequestDtoSerializer;
}
