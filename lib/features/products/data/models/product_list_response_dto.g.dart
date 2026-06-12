// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductListResponseDto> _$productListResponseDtoSerializer =
    _$ProductListResponseDtoSerializer();

class _$ProductListResponseDtoSerializer
    implements StructuredSerializer<ProductListResponseDto> {
  @override
  final Iterable<Type> types = const [
    ProductListResponseDto,
    _$ProductListResponseDto,
  ];
  @override
  final String wireName = 'ProductListResponseDto';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ProductListResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, const [
          const FullType(ProductDto),
        ]),
      ),
      'meta',
      serializers.serialize(
        object.meta,
        specifiedType: const FullType(PaginationMetaDto),
      ),
    ];

    return result;
  }

  @override
  ProductListResponseDto deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProductListResponseDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(ProductDto),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'meta':
          result.meta.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(PaginationMetaDto),
                )!
                as PaginationMetaDto,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$ProductListResponseDto extends ProductListResponseDto {
  @override
  final BuiltList<ProductDto> data;
  @override
  final PaginationMetaDto meta;

  factory _$ProductListResponseDto([
    void Function(ProductListResponseDtoBuilder)? updates,
  ]) => (ProductListResponseDtoBuilder()..update(updates))._build();

  _$ProductListResponseDto._({required this.data, required this.meta})
    : super._();
  @override
  ProductListResponseDto rebuild(
    void Function(ProductListResponseDtoBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ProductListResponseDtoBuilder toBuilder() =>
      ProductListResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductListResponseDto &&
        data == other.data &&
        meta == other.meta;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductListResponseDto')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class ProductListResponseDtoBuilder
    implements Builder<ProductListResponseDto, ProductListResponseDtoBuilder> {
  _$ProductListResponseDto? _$v;

  ListBuilder<ProductDto>? _data;
  ListBuilder<ProductDto> get data =>
      _$this._data ??= ListBuilder<ProductDto>();
  set data(ListBuilder<ProductDto>? data) => _$this._data = data;

  PaginationMetaDtoBuilder? _meta;
  PaginationMetaDtoBuilder get meta =>
      _$this._meta ??= PaginationMetaDtoBuilder();
  set meta(PaginationMetaDtoBuilder? meta) => _$this._meta = meta;

  ProductListResponseDtoBuilder();

  ProductListResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _meta = $v.meta.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductListResponseDto other) {
    _$v = other as _$ProductListResponseDto;
  }

  @override
  void update(void Function(ProductListResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductListResponseDto build() => _build();

  _$ProductListResponseDto _build() {
    _$ProductListResponseDto _$result;
    try {
      _$result =
          _$v ??
          _$ProductListResponseDto._(data: data.build(), meta: meta.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ProductListResponseDto',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
