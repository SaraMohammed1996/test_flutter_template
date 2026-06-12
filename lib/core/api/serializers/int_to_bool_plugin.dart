import 'package:built_value/serializer.dart';

/// Custom plugin to handle APIs that return 0/1 for boolean values
class IntToBoolPlugin implements SerializerPlugin {
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
    // Convert int (0/1) to bool during deserialization
    if (specifiedType.root == bool) {
      if (object is int) {
        return object == 1;
      } else if (object is String) {
        return object == '1' || object.toLowerCase() == 'true';
      }
    }
    return object;
  }

  @override
  Object? beforeSerialize(Object? object, FullType specifiedType) {
    return object;
  }
}
