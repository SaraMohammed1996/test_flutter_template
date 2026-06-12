// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_product_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UpdateProductRequestDto> _$updateProductRequestDtoSerializer =
    _$UpdateProductRequestDtoSerializer();

class _$UpdateProductRequestDtoSerializer
    implements StructuredSerializer<UpdateProductRequestDto> {
  @override
  final Iterable<Type> types = const [
    UpdateProductRequestDto,
    _$UpdateProductRequestDto,
  ];
  @override
  final String wireName = 'UpdateProductRequestDto';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    UpdateProductRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.quantity;
    if (value != null) {
      result
        ..add('quantity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    return result;
  }

  @override
  UpdateProductRequestDto deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateProductRequestDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'description':
          result.description =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'price':
          result.price =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'quantity':
          result.quantity =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'image':
          result.image =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$UpdateProductRequestDto extends UpdateProductRequestDto {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? price;
  @override
  final int? quantity;
  @override
  final String? image;

  factory _$UpdateProductRequestDto([
    void Function(UpdateProductRequestDtoBuilder)? updates,
  ]) => (UpdateProductRequestDtoBuilder()..update(updates))._build();

  _$UpdateProductRequestDto._({
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.image,
  }) : super._();
  @override
  UpdateProductRequestDto rebuild(
    void Function(UpdateProductRequestDtoBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  UpdateProductRequestDtoBuilder toBuilder() =>
      UpdateProductRequestDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateProductRequestDto &&
        name == other.name &&
        description == other.description &&
        price == other.price &&
        quantity == other.quantity &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateProductRequestDto')
          ..add('name', name)
          ..add('description', description)
          ..add('price', price)
          ..add('quantity', quantity)
          ..add('image', image))
        .toString();
  }
}

class UpdateProductRequestDtoBuilder
    implements
        Builder<UpdateProductRequestDto, UpdateProductRequestDtoBuilder> {
  _$UpdateProductRequestDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  UpdateProductRequestDtoBuilder();

  UpdateProductRequestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _price = $v.price;
      _quantity = $v.quantity;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateProductRequestDto other) {
    _$v = other as _$UpdateProductRequestDto;
  }

  @override
  void update(void Function(UpdateProductRequestDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateProductRequestDto build() => _build();

  _$UpdateProductRequestDto _build() {
    final _$result =
        _$v ??
        _$UpdateProductRequestDto._(
          name: name,
          description: description,
          price: price,
          quantity: quantity,
          image: image,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
