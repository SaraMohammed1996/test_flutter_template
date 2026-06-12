// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boolean_flag.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const BooleanFlag _$flagDisabled = const BooleanFlag._('disabled');
const BooleanFlag _$flagEnabled = const BooleanFlag._('enabled');

BooleanFlag _$booleanFlagValueOf(String name) {
  switch (name) {
    case 'disabled':
      return _$flagDisabled;
    case 'enabled':
      return _$flagEnabled;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<BooleanFlag> _$booleanFlagValues = BuiltSet<BooleanFlag>(
  const <BooleanFlag>[_$flagDisabled, _$flagEnabled],
);

Serializer<BooleanFlag> _$booleanFlagSerializer = _$BooleanFlagSerializer();

class _$BooleanFlagSerializer implements PrimitiveSerializer<BooleanFlag> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'disabled': 0,
    'enabled': 1,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    0: 'disabled',
    1: 'enabled',
  };

  @override
  final Iterable<Type> types = const <Type>[BooleanFlag];
  @override
  final String wireName = 'BooleanFlag';

  @override
  Object serialize(
    Serializers serializers,
    BooleanFlag object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  BooleanFlag deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => BooleanFlag.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
