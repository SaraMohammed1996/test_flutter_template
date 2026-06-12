import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:test_flutter_template/features/products/domain/models/product.dart';

part 'product_dto.g.dart';

abstract class ProductDto implements Built<ProductDto, ProductDtoBuilder> {
  int get id;
  String get name;
  String? get image;
  String? get description;
  String get price;
  int get quantity;
  @BuiltValueField(wireName: 'created_at')
  String? get createdAt;
  @BuiltValueField(wireName: 'updated_at')
  String? get updatedAt;

  ProductDto._();
  factory ProductDto([void Function(ProductDtoBuilder) updates]) = _$ProductDto;

  static Serializer<ProductDto> get serializer => _$productDtoSerializer;

  Product toDomain() => Product(
        id: id,
        name: name,
        image: image,
        description: description,
        price: double.tryParse(price) ?? 0,
        quantity: quantity,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
