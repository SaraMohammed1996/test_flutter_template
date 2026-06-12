import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:test_flutter_template/core/api/serializers.dart';

part 'boolean_flag.g.dart';

/// Enum for boolean flag values (0 or 1)
/// Used for API query parameters that accept 0 or 1 as boolean flags
/// This is a generic enum that can be used across the entire codebase
class BooleanFlag extends EnumClass {
  static Serializer<BooleanFlag> get serializer => _$booleanFlagSerializer;

  @BuiltValueEnumConst(wireNumber: 0)
  static const BooleanFlag disabled = _$flagDisabled;

  @BuiltValueEnumConst(wireNumber: 1)
  static const BooleanFlag enabled = _$flagEnabled;

  const BooleanFlag._(super.name);

  static BuiltSet<BooleanFlag> get values => _$booleanFlagValues;
  static BooleanFlag valueOf(String name) => _$booleanFlagValueOf(name);

  int serialize() {
    return serializers.serializeWith(BooleanFlag.serializer, this) as int;
  }

  static BooleanFlag? deserialize(int value) {
    return serializers.deserializeWith(BooleanFlag.serializer, value);
  }

  /// Convert to boolean value
  bool toBool() => this == BooleanFlag.enabled;

  /// Create from boolean value
  static BooleanFlag fromBool(bool value) =>
      value ? BooleanFlag.enabled : BooleanFlag.disabled;

  @override
  String toString() {
    // For query parameters, return the wireNumber as string
    return serialize().toString();
  }
}
