// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'profile_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ProfileService extends ProfileService {
  _$ProfileService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ProfileService;

  @override
  Future<Response<UserDto>> getProfile() {
    final Uri $url = Uri.parse('/profile');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<UserDto, UserDto>($request);
  }

  @override
  Future<Response<UserDto>> updateProfile(UpdateProfileRequestDto body) {
    final Uri $url = Uri.parse('/profile');
    final $body = body;
    final Request $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<UserDto, UserDto>($request);
  }
}
