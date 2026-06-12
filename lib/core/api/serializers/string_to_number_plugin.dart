import 'package:built_value/serializer.dart';

/// Custom plugin to handle APIs that return strings for numeric values
class StringToNumberPlugin implements SerializerPlugin {
  @override
  Object? afterDeserialize(Object? object, FullType specifiedType) {
    return object;
  }

  @override
  Object? afterSerialize(Object? object, FullType specifiedType) {
    return object;
  }

  @override
  Object? beforeDeserialize(Object? object, FullType specifiedType) {
    // Convert string to number during deserialization
    if (object == null) return object;

    final rootType = specifiedType.root;

    // Handle double types
    if (rootType == double) {
      if (object is String) {
        // Try to parse the string to double
        // Returns null if parsing fails (appropriate for nullable types)
        return double.tryParse(object);
      } else if (object is int) {
        return object.toDouble();
      } else if (object is num) {
        return object.toDouble();
      }
    }

    // Handle int types
    if (rootType == int) {
      if (object is String) {
        // Try to parse the string to int
        // Returns null if parsing fails (appropriate for nullable types)
        return int.tryParse(object);
      } else if (object is double) {
        return object.toInt();
      } else if (object is num) {
        return object.toInt();
      }
    }

    return object;
  }

  @override
  Object? beforeSerialize(Object? object, FullType specifiedType) {
    return object;
  }
}
