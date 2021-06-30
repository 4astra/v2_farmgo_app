import 'dart:async';

import 'package:authen_api/authen_api.dart';

class AuthenFailure implements Exception {}

class AuthenRepository {
  AuthenRepository({AuthenApiClient? authenApiClient})
      : _authenApiClient = authenApiClient ?? AuthenApiClient();

  Future<JWTToken> login(LoginDTO loginDTO) async {
    final result = await _authenApiClient.login(loginDTO);
    return result;
  }

  final AuthenApiClient _authenApiClient;
}
