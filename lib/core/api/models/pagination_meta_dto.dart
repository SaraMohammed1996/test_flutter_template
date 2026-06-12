import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pagination_meta_dto.g.dart';

/// Pagination meta information DTO
///
/// Reusable DTO for pagination metadata that can be used across all features
/// that have paginated API responses.
abstract class PaginationMetaDto
    implements Built<PaginationMetaDto, PaginationMetaDtoBuilder> {
  @BuiltValueField(wireName: 'current_page')
  int get currentPage;
  @BuiltValueField(wireName: 'last_page')
  int get lastPage;
  @BuiltValueField(wireName: 'per_page')
  int get perPage;
  int get total;
  int? get from;
  int? get to;
  @BuiltValueField(wireName: 'unreaded_count')
  int? get unreadedCount;

  PaginationMetaDto._();
  factory PaginationMetaDto([void Function(PaginationMetaDtoBuilder) updates]) =
      _$PaginationMetaDto;

  static Serializer<PaginationMetaDto> get serializer =>
      _$paginationMetaDtoSerializer;
}
