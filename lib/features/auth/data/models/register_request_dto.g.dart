// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RegisterRequestDto> _$registerRequestDtoSerializer =
    _$RegisterRequestDtoSerializer();

class _$RegisterRequestDtoSerializer
    implements StructuredSerializer<RegisterRequestDto> {
  @override
  final Iterable<Type> types = const [RegisterRequestDto, _$RegisterRequestDto];
  @override
  final String wireName = 'RegisterRequestDto';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    RegisterRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'email',
      serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      ),
      'password',
      serializers.serialize(
        object.password,
        specifiedType: const FullType(String),
      ),
      'password_confirmation',
      serializers.serialize(
        object.passwordConfirmation,
        specifiedType: const FullType(String),
      ),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  RegisterRequestDto deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterRequestDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'password':
          result.password =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'password_confirmation':
          result.passwordConfirmation =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'name':
          result.name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RegisterRequestDto extends RegisterRequestDto {
  @override
  final String email;
  @override
  final String password;
  @override
  final String passwordConfirmation;
  @override
  final String name;

  factory _$RegisterRequestDto([
    void Function(RegisterRequestDtoBuilder)? updates,
  ]) => (RegisterRequestDtoBuilder()..update(updates))._build();

  _$RegisterRequestDto._({
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.name,
  }) : super._();
  @override
  RegisterRequestDto rebuild(
    void Function(RegisterRequestDtoBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  RegisterRequestDtoBuilder toBuilder() =>
      RegisterRequestDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterRequestDto &&
        email == other.email &&
        password == other.password &&
        passwordConfirmation == other.passwordConfirmation &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, passwordConfirmation.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterRequestDto')
          ..add('email', email)
          ..add('password', password)
          ..add('passwordConfirmation', passwordConfirmation)
          ..add('name', name))
        .toString();
  }
}

class RegisterRequestDtoBuilder
    implements Builder<RegisterRequestDto, RegisterRequestDtoBuilder> {
  _$RegisterRequestDto? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _passwordConfirmation;
  String? get passwordConfirmation => _$this._passwordConfirmation;
  set passwordConfirmation(String? passwordConfirmation) =>
      _$this._passwordConfirmation = passwordConfirmation;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  RegisterRequestDtoBuilder();

  RegisterRequestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _password = $v.password;
      _passwordConfirmation = $v.passwordConfirmation;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterRequestDto other) {
    _$v = other as _$RegisterRequestDto;
  }

  @override
  void update(void Function(RegisterRequestDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterRequestDto build() => _build();

  _$RegisterRequestDto _build() {
    final _$result =
        _$v ??
        _$RegisterRequestDto._(
          email: BuiltValueNullFieldError.checkNotNull(
            email,
            r'RegisterRequestDto',
            'email',
          ),
          password: BuiltValueNullFieldError.checkNotNull(
            password,
            r'RegisterRequestDto',
            'password',
          ),
          passwordConfirmation: BuiltValueNullFieldError.checkNotNull(
            passwordConfirmation,
            r'RegisterRequestDto',
            'passwordConfirmation',
          ),
          name: BuiltValueNullFieldError.checkNotNull(
            name,
            r'RegisterRequestDto',
            'name',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
