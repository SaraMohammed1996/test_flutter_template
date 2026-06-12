// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CreateProductRequestDto> _$createProductRequestDtoSerializer =
    _$CreateProductRequestDtoSerializer();

class _$CreateProductRequestDtoSerializer
    implements StructuredSerializer<CreateProductRequestDto> {
  @override
  final Iterable<Type> types = const [
    CreateProductRequestDto,
    _$CreateProductRequestDto,
  ];
  @override
  final String wireName = 'CreateProductRequestDto';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    CreateProductRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'price',
      serializers.serialize(
        object.price,
        specifiedType: const FullType(double),
      ),
      'quantity',
      serializers.serialize(
        object.quantity,
        specifiedType: const FullType(int),
      ),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
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
  CreateProductRequestDto deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateProductRequestDtoBuilder();

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
                  )!
                  as String;
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
                  )!
                  as double;
          break;
        case 'quantity':
          result.quantity =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
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

class _$CreateProductRequestDto extends CreateProductRequestDto {
  @override
  final String name;
  @override
  final String? description;
  @override
  final double price;
  @override
  final int quantity;
  @override
  final String? image;

  factory _$CreateProductRequestDto([
    void Function(CreateProductRequestDtoBuilder)? updates,
  ]) => (CreateProductRequestDtoBuilder()..update(updates))._build();

  _$CreateProductRequestDto._({
    required this.name,
    this.description,
    required this.price,
    required this.quantity,
    this.image,
  }) : super._();
  @override
  CreateProductRequestDto rebuild(
    void Function(CreateProductRequestDtoBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  CreateProductRequestDtoBuilder toBuilder() =>
      CreateProductRequestDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateProductRequestDto &&
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
    return (newBuiltValueToStringHelper(r'CreateProductRequestDto')
          ..add('name', name)
          ..add('description', description)
          ..add('price', price)
          ..add('quantity', quantity)
          ..add('image', image))
        .toString();
  }
}

class CreateProductRequestDtoBuilder
    implements
        Builder<CreateProductRequestDto, CreateProductRequestDtoBuilder> {
  _$CreateProductRequestDto? _$v;

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

  CreateProductRequestDtoBuilder();

  CreateProductRequestDtoBuilder get _$this {
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
  void replace(CreateProductRequestDto other) {
    _$v = other as _$CreateProductRequestDto;
  }

  @override
  void update(void Function(CreateProductRequestDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateProductRequestDto build() => _build();

  _$CreateProductRequestDto _build() {
    final _$result =
        _$v ??
        _$CreateProductRequestDto._(
          name: BuiltValueNullFieldError.checkNotNull(
            name,
            r'CreateProductRequestDto',
            'name',
          ),
          description: description,
          price: BuiltValueNullFieldError.checkNotNull(
            price,
            r'CreateProductRequestDto',
            'price',
          ),
          quantity: BuiltValueNullFieldError.checkNotNull(
            quantity,
            r'CreateProductRequestDto',
            'quantity',
          ),
          image: image,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
