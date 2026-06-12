// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_success_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ApiSuccessResponseDto> _$apiSuccessResponseDtoSerializer =
    _$ApiSuccessResponseDtoSerializer();

class _$ApiSuccessResponseDtoSerializer
    implements StructuredSerializer<ApiSuccessResponseDto> {
  @override
  final Iterable<Type> types = const [
    ApiSuccessResponseDto,
    _$ApiSuccessResponseDto,
  ];
  @override
  final String wireName = 'ApiSuccessResponseDto';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ApiSuccessResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'success',
      serializers.serialize(
        object.success,
        specifiedType: const FullType(bool),
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
  ApiSuccessResponseDto deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiSuccessResponseDtoBuilder();

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
      }
    }

    return result.build();
  }
}

class _$ApiSuccessResponseDto extends ApiSuccessResponseDto {
  @override
  final bool success;
  @override
  final String? message;

  factory _$ApiSuccessResponseDto([
    void Function(ApiSuccessResponseDtoBuilder)? updates,
  ]) => (ApiSuccessResponseDtoBuilder()..update(updates))._build();

  _$ApiSuccessResponseDto._({required this.success, this.message}) : super._();
  @override
  ApiSuccessResponseDto rebuild(
    void Function(ApiSuccessResponseDtoBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ApiSuccessResponseDtoBuilder toBuilder() =>
      ApiSuccessResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiSuccessResponseDto &&
        success == other.success &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiSuccessResponseDto')
          ..add('success', success)
          ..add('message', message))
        .toString();
  }
}

class ApiSuccessResponseDtoBuilder
    implements Builder<ApiSuccessResponseDto, ApiSuccessResponseDtoBuilder> {
  _$ApiSuccessResponseDto? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ApiSuccessResponseDtoBuilder();

  ApiSuccessResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiSuccessResponseDto other) {
    _$v = other as _$ApiSuccessResponseDto;
  }

  @override
  void update(void Function(ApiSuccessResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiSuccessResponseDto build() => _build();

  _$ApiSuccessResponseDto _build() {
    final _$result =
        _$v ??
        _$ApiSuccessResponseDto._(
          success: BuiltValueNullFieldError.checkNotNull(
            success,
            r'ApiSuccessResponseDto',
            'success',
          ),
          message: message,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
