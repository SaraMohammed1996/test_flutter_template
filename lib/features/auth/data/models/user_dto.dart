import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:test_flutter_template/features/auth/domain/models/user.dart';

part 'user_dto.g.dart';

abstract class UserDto implements Built<UserDto, UserDtoBuilder> {
  int get id;
  String get name;
  String get email;
  @BuiltValueField(wireName: 'email_verified_at')
  String? get emailVerifiedAt;
  @BuiltValueField(wireName: 'created_at')
  String? get createdAt;

  UserDto._();
  factory UserDto([void Function(UserDtoBuilder) updates]) = _$UserDto;

  static Serializer<UserDto> get serializer => _$userDtoSerializer;

  User toDomain() => User(id: id, name: name, email: email);
}
