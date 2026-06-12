// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductDto> _$productDtoSerializer = _$ProductDtoSerializer();

class _$ProductDtoSerializer implements StructuredSerializer<ProductDto> {
  @override
  final Iterable<Type> types = const [ProductDto, _$ProductDto];
  @override
  final String wireName = 'ProductDto';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ProductDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'price',
      serializers.serialize(
        object.price,
        specifiedType: const FullType(String),
      ),
      'quantity',
      serializers.serialize(
        object.quantity,
        specifiedType: const FullType(int),
      ),
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
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
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    return result;
  }

  @override
  ProductDto deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProductDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'name':
          result.name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'image':
          result.image =
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
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'quantity':
          result.quantity =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'created_at':
          result.createdAt =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'updated_at':
          result.updatedAt =
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

class _$ProductDto extends ProductDto {
  @override
  final int id;
  @override
  final String name;
  @override
  final String? image;
  @override
  final String? description;
  @override
  final String price;
  @override
  final int quantity;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  factory _$ProductDto([void Function(ProductDtoBuilder)? updates]) =>
      (ProductDtoBuilder()..update(updates))._build();

  _$ProductDto._({
    required this.id,
    required this.name,
    this.image,
    this.description,
    required this.price,
    required this.quantity,
    this.createdAt,
    this.updatedAt,
  }) : super._();
  @override
  ProductDto rebuild(void Function(ProductDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductDtoBuilder toBuilder() => ProductDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductDto &&
        id == other.id &&
        name == other.name &&
        image == other.image &&
        description == other.description &&
        price == other.price &&
        quantity == other.quantity &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductDto')
          ..add('id', id)
          ..add('name', name)
          ..add('image', image)
          ..add('description', description)
          ..add('price', price)
          ..add('quantity', quantity)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class ProductDtoBuilder implements Builder<ProductDto, ProductDtoBuilder> {
  _$ProductDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _price;
  String? get price => _$this._price;
  set price(String? price) => _$this._price = price;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ProductDtoBuilder();

  ProductDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _image = $v.image;
      _description = $v.description;
      _price = $v.price;
      _quantity = $v.quantity;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductDto other) {
    _$v = other as _$ProductDto;
  }

  @override
  void update(void Function(ProductDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductDto build() => _build();

  _$ProductDto _build() {
    final _$result =
        _$v ??
        _$ProductDto._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'ProductDto', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
            name,
            r'ProductDto',
            'name',
          ),
          image: image,
          description: description,
          price: BuiltValueNullFieldError.checkNotNull(
            price,
            r'ProductDto',
            'price',
          ),
          quantity: BuiltValueNullFieldError.checkNotNull(
            quantity,
            r'ProductDto',
            'quantity',
          ),
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
