import 'dart:io';

import 'package:test_flutter_template/core/api/errors/api_errors.dart';
import 'package:test_flutter_template/core/api/services/auth_service.dart';
import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/core/storage/token_storage.dart';
import 'package:test_flutter_template/core/utils/network_error_helper.dart';
import 'package:test_flutter_template/features/auth/data/models/login_request_dto.dart';
import 'package:test_flutter_template/features/auth/data/models/register_request_dto.dart';
import 'package:test_flutter_template/features/auth/domain/models/auth_session.dart';

class AuthRepository {
  final AuthService _service;
  final TokenStorage _tokenStorage;

  const AuthRepository(this._service, this._tokenStorage);

  Future<Result<AuthSession>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _service.login(
        LoginRequestDto(
          (LoginRequestDtoBuilder builder) => builder
            ..email = email
            ..password = password,
        ),
      );

      if (!response.isSuccessful || response.body == null) {
        return Failure(
          message: response.body?.message ??
              response.error?.toString() ??
              'Login failed',
        );
      }

      final AuthSession session = response.body!.toDomain();
      await _tokenStorage.saveToken(session.token);
      return Success(session);
    } on ResponseValidationError catch (e) {
      return Failure(message: e.message, code: e.code, data: e.data);
    } on ResponseError catch (e) {
      return Failure(message: e.message ?? 'Login failed', code: e.code);
    } on SocketException {
      return const Failure(
        message: 'No internet connection',
        code: 'NETWORK_ERROR',
      );
    } catch (e) {
      if (NetworkErrorHelper.isNetworkError(e)) {
        return const Failure(
          message: 'No internet connection',
          code: 'NETWORK_ERROR',
        );
      }
      return Failure(message: e.toString());
    }
  }

  Future<Result<AuthSession>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await _service.register(
        RegisterRequestDto(
          (RegisterRequestDtoBuilder builder) => builder
            ..name = name
            ..email = email
            ..password = password
            ..passwordConfirmation = passwordConfirmation,
        ),
      );

      if (!response.isSuccessful || response.body == null) {
        return Failure(
          message: response.body?.message ??
              response.error?.toString() ??
              'Registration failed',
        );
      }

      final AuthSession session = response.body!.toDomain();
      await _tokenStorage.saveToken(session.token);
      return Success(session);
    } on ResponseValidationError catch (e) {
      return Failure(message: e.message, code: e.code, data: e.data);
    } on ResponseError catch (e) {
      return Failure(
        message: e.message ?? 'Registration failed',
        code: e.code,
      );
    } on SocketException {
      return const Failure(
        message: 'No internet connection',
        code: 'NETWORK_ERROR',
      );
    } catch (e) {
      if (NetworkErrorHelper.isNetworkError(e)) {
        return const Failure(
          message: 'No internet connection',
          code: 'NETWORK_ERROR',
        );
      }
      return Failure(message: e.toString());
    }
  }

  Future<Result<void>> logout() async {
    try {
      await _service.logout();
    } catch (_) {
      // Clear local token even if the API call fails.
    }

    await _tokenStorage.clearToken();
    return const Success(null);
  }
}
