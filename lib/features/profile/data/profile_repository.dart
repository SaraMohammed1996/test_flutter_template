import 'dart:io';

import 'package:test_flutter_template/core/api/errors/api_errors.dart';
import 'package:test_flutter_template/core/api/services/profile_service.dart';
import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/features/auth/domain/models/user.dart';
import 'package:test_flutter_template/features/profile/data/models/update_profile_request_dto.dart';

class ProfileRepository {
  final ProfileService _service;

  ProfileRepository(this._service);

  Future<Result<User>> getProfile() async {
    try {
      final response = await _service.getProfile();

      if (response.isSuccessful && response.body != null) {
        return Success(response.body!.toDomain());
      }

      return const Failure(message: 'Failed to load profile');
    } on ResponseValidationError catch (e) {
      return Failure(message: e.message, code: e.code, data: e.data);
    } on ResponseError catch (e) {
      return Failure(
        message: e.message ?? 'Failed to load profile',
        code: e.code,
      );
    } on SocketException {
      return const Failure(
        message: 'No internet connection',
        code: 'NETWORK_ERROR',
      );
    } catch (e) {
      return Failure(message: e.toString());
    }
  }

  Future<Result<User>> updateProfile({
    String? name,
    String? email,
  }) async {
    try {
      final response = await _service.updateProfile(
        UpdateProfileRequestDto(
          (UpdateProfileRequestDtoBuilder builder) => builder
            ..name = name
            ..email = email,
        ),
      );

      if (response.isSuccessful && response.body != null) {
        return Success(response.body!.toDomain());
      }

      return const Failure(message: 'Failed to update profile');
    } on ResponseValidationError catch (e) {
      return Failure(message: e.message, code: e.code, data: e.data);
    } on ResponseError catch (e) {
      return Failure(
        message: e.message ?? 'Failed to update profile',
        code: e.code,
      );
    } on SocketException {
      return const Failure(
        message: 'No internet connection',
        code: 'NETWORK_ERROR',
      );
    } catch (e) {
      return Failure(message: e.toString());
    }
  }
}
