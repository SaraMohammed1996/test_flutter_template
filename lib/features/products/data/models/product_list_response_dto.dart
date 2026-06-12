import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:test_flutter_template/core/api/models/pagination_meta_dto.dart';
import 'package:test_flutter_template/core/domain/paginated_list.dart';
import 'package:test_flutter_template/features/products/data/models/product_dto.dart';
import 'package:test_flutter_template/features/products/domain/models/product.dart';

part 'product_list_response_dto.g.dart';

abstract class ProductListResponseDto
    implements Built<ProductListResponseDto, ProductListResponseDtoBuilder> {
  BuiltList<ProductDto> get data;
  PaginationMetaDto get meta;

  ProductListResponseDto._();
  factory ProductListResponseDto(
          [void Function(ProductListResponseDtoBuilder) updates]) =
      _$ProductListResponseDto;

  static Serializer<ProductListResponseDto> get serializer =>
      _$productListResponseDtoSerializer;

  PaginatedList<Product> toDomain() => PaginatedList<Product>(
        items: data.map((ProductDto dto) => dto.toDomain()).toList(),
        currentPage: meta.currentPage,
        lastPage: meta.lastPage,
        perPage: meta.perPage,
        total: meta.total,
      );
}
