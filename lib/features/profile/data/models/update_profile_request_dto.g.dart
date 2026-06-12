// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UpdateProfileRequestDto> _$updateProfileRequestDtoSerializer =
    _$UpdateProfileRequestDtoSerializer();

class _$UpdateProfileRequestDtoSerializer
    implements StructuredSerializer<UpdateProfileRequestDto> {
  @override
  final Iterable<Type> types = const [
    UpdateProfileRequestDto,
    _$UpdateProfileRequestDto,
  ];
  @override
  final String wireName = 'UpdateProfileRequestDto';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    UpdateProfileRequestDto object, {
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
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    return result;
  }

  @override
  UpdateProfileRequestDto deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateProfileRequestDtoBuilder();

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
        case 'email':
          result.email =
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

class _$UpdateProfileRequestDto extends UpdateProfileRequestDto {
  @override
  final String? name;
  @override
  final String? email;

  factory _$UpdateProfileRequestDto([
    void Function(UpdateProfileRequestDtoBuilder)? updates,
  ]) => (UpdateProfileRequestDtoBuilder()..update(updates))._build();

  _$UpdateProfileRequestDto._({this.name, this.email}) : super._();
  @override
  UpdateProfileRequestDto rebuild(
    void Function(UpdateProfileRequestDtoBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  UpdateProfileRequestDtoBuilder toBuilder() =>
      UpdateProfileRequestDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateProfileRequestDto &&
        name == other.name &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateProfileRequestDto')
          ..add('name', name)
          ..add('email', email))
        .toString();
  }
}

class UpdateProfileRequestDtoBuilder
    implements
        Builder<UpdateProfileRequestDto, UpdateProfileRequestDtoBuilder> {
  _$UpdateProfileRequestDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  UpdateProfileRequestDtoBuilder();

  UpdateProfileRequestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateProfileRequestDto other) {
    _$v = other as _$UpdateProfileRequestDto;
  }

  @override
  void update(void Function(UpdateProfileRequestDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateProfileRequestDto build() => _build();

  _$UpdateProfileRequestDto _build() {
    final _$result =
        _$v ?? _$UpdateProfileRequestDto._(name: name, email: email);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
