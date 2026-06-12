// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'auth_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AuthService extends AuthService {
  _$AuthService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AuthService;

  @override
  Future<Response<AuthApiResponseDto>> register(RegisterRequestDto body) {
    final Uri $url = Uri.parse('/register');
    final $body = body;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AuthApiResponseDto, AuthApiResponseDto>($request);
  }

  @override
  Future<Response<AuthApiResponseDto>> login(LoginRequestDto body) {
    final Uri $url = Uri.parse('/login');
    final $body = body;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AuthApiResponseDto, AuthApiResponseDto>($request);
  }

  @override
  Future<Response<ApiSuccessResponseDto>> logout() {
    final Uri $url = Uri.parse('/logout');
    final Request $request = Request('POST', $url, client.baseUrl);
    return client.send<ApiSuccessResponseDto, ApiSuccessResponseDto>($request);
  }
}
