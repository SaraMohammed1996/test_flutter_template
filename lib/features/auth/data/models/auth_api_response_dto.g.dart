// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthApiResponseDto> _$authApiResponseDtoSerializer =
    _$AuthApiResponseDtoSerializer();

class _$AuthApiResponseDtoSerializer
    implements StructuredSerializer<AuthApiResponseDto> {
  @override
  final Iterable<Type> types = const [AuthApiResponseDto, _$AuthApiResponseDto];
  @override
  final String wireName = 'AuthApiResponseDto';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    AuthApiResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'success',
      serializers.serialize(
        object.success,
        specifiedType: const FullType(bool),
      ),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(AuthResponseDto),
      ),
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    return result;
  }

  @override
  AuthApiResponseDto deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthApiResponseDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )!
                  as bool;
          break;
        case 'message':
          result.message =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'data':
          result.data.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(AuthResponseDto),
                )!
                as AuthResponseDto,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$AuthApiResponseDto extends AuthApiResponseDto {
  @override
  final bool success;
  @override
  final String? message;
  @override
  final AuthResponseDto data;

  factory _$AuthApiResponseDto([
    void Function(AuthApiResponseDtoBuilder)? updates,
  ]) => (AuthApiResponseDtoBuilder()..update(updates))._build();

  _$AuthApiResponseDto._({
    required this.success,
    this.message,
    required this.data,
  }) : super._();
  @override
  AuthApiResponseDto rebuild(
    void Function(AuthApiResponseDtoBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  AuthApiResponseDtoBuilder toBuilder() =>
      AuthApiResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthApiResponseDto &&
        success == other.success &&
        message == other.message &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthApiResponseDto')
          ..add('success', success)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class AuthApiResponseDtoBuilder
    implements Builder<AuthApiResponseDto, AuthApiResponseDtoBuilder> {
  _$AuthApiResponseDto? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AuthResponseDtoBuilder? _data;
  AuthResponseDtoBuilder get data => _$this._data ??= AuthResponseDtoBuilder();
  set data(AuthResponseDtoBuilder? data) => _$this._data = data;

  AuthApiResponseDtoBuilder();

  AuthApiResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthApiResponseDto other) {
    _$v = other as _$AuthApiResponseDto;
  }

  @override
  void update(void Function(AuthApiResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthApiResponseDto build() => _build();

  _$AuthApiResponseDto _build() {
    _$AuthApiResponseDto _$result;
    try {
      _$result =
          _$v ??
          _$AuthApiResponseDto._(
            success: BuiltValueNullFieldError.checkNotNull(
              success,
              r'AuthApiResponseDto',
              'success',
            ),
            message: message,
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'AuthApiResponseDto',
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
