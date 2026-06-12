import 'package:chopper/chopper.dart';
import 'package:test_flutter_template/features/auth/data/models/user_dto.dart';
import 'package:test_flutter_template/features/profile/data/models/update_profile_request_dto.dart';

part 'profile_service.chopper.dart';

@ChopperApi()
abstract class ProfileService extends ChopperService {
  static ProfileService create([ChopperClient? client]) =>
      _$ProfileService(client);

  @GET(path: '/profile')
  Future<Response<UserDto>> getProfile();

  @PUT(path: '/profile')
  Future<Response<UserDto>> updateProfile(
    @Body() UpdateProfileRequestDto body,
  );
}
