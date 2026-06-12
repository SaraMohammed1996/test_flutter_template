// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthResponseDto> _$authResponseDtoSerializer =
    _$AuthResponseDtoSerializer();

class _$AuthResponseDtoSerializer
    implements StructuredSerializer<AuthResponseDto> {
  @override
  final Iterable<Type> types = const [AuthResponseDto, _$AuthResponseDto];
  @override
  final String wireName = 'AuthResponseDto';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    AuthResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'user',
      serializers.serialize(
        object.user,
        specifiedType: const FullType(UserDto),
      ),
      'token',
      serializers.serialize(
        object.token,
        specifiedType: const FullType(String),
      ),
    ];
    Object? value;
    value = object.tokenType;
    if (value != null) {
      result
        ..add('token_type')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    return result;
  }

  @override
  AuthResponseDto deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthResponseDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user':
          result.user.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(UserDto),
                )!
                as UserDto,
          );
          break;
        case 'token':
          result.token =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'token_type':
          result.tokenType =
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

class _$AuthResponseDto extends AuthResponseDto {
  @override
  final UserDto user;
  @override
  final String token;
  @override
  final String? tokenType;

  factory _$AuthResponseDto([void Function(AuthResponseDtoBuilder)? updates]) =>
      (AuthResponseDtoBuilder()..update(updates))._build();

  _$AuthResponseDto._({required this.user, required this.token, this.tokenType})
    : super._();
  @override
  AuthResponseDto rebuild(void Function(AuthResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthResponseDtoBuilder toBuilder() => AuthResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthResponseDto &&
        user == other.user &&
        token == other.token &&
        tokenType == other.tokenType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, tokenType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthResponseDto')
          ..add('user', user)
          ..add('token', token)
          ..add('tokenType', tokenType))
        .toString();
  }
}

class AuthResponseDtoBuilder
    implements Builder<AuthResponseDto, AuthResponseDtoBuilder> {
  _$AuthResponseDto? _$v;

  UserDtoBuilder? _user;
  UserDtoBuilder get user => _$this._user ??= UserDtoBuilder();
  set user(UserDtoBuilder? user) => _$this._user = user;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _tokenType;
  String? get tokenType => _$this._tokenType;
  set tokenType(String? tokenType) => _$this._tokenType = tokenType;

  AuthResponseDtoBuilder();

  AuthResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user.toBuilder();
      _token = $v.token;
      _tokenType = $v.tokenType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthResponseDto other) {
    _$v = other as _$AuthResponseDto;
  }

  @override
  void update(void Function(AuthResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthResponseDto build() => _build();

  _$AuthResponseDto _build() {
    _$AuthResponseDto _$result;
    try {
      _$result =
          _$v ??
          _$AuthResponseDto._(
            user: user.build(),
            token: BuiltValueNullFieldError.checkNotNull(
              token,
              r'AuthResponseDto',
              'token',
            ),
            tokenType: tokenType,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'AuthResponseDto',
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
