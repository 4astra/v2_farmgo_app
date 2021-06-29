import 'dart:async';
import 'dart:convert';
import 'package:authen_api/src/models/login_dto.dart';
import 'package:http/http.dart' as http;
import 'package:authen_api/authen_api.dart';

/// Exception thrown when getAuthen fails.
class AuthenRequestFailure implements Exception {}

/// Exception thrown when authen for provided jwt token is not found.
class AuthenNotFoundFailure implements Exception {}

/// {@template meta_weather_api_client}
/// Dart API Client which wraps the [Authen API](https://farm-go.herokuapp.com)
/// {@endtemplate}
///
class AuthenApiClient {
  /// {@macro authen_api_client}
  AuthenApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'farm-go.herokuapp.com/api';
  final http.Client _httpClient;

  /// Get [JWTToken] `/api/login`.
  Future<JWTToken> login(LoginDTO loginDTO) async {
    final json = jsonEncode(loginDTO.toJson());

    print('loginDTO:$json');

    final loginRequest = Uri.https(_baseUrl, '/api/login');
    final loginResponse = await _httpClient.post(loginRequest, body: json);

    if (loginResponse.statusCode != 200) {
      throw AuthenRequestFailure();
    }

    final jwtJson = jsonDecode(
      loginResponse.body,
    ) as Map<String, dynamic>;

    if (jwtJson.isEmpty) {
      throw AuthenNotFoundFailure();
    }

    return JWTToken.fromJson(jwtJson);
  }
}
