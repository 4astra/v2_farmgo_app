// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JWTToken _$JWTTokenFromJson(Map<String, dynamic> json) {
  return JWTToken(
    token: json['result'] as String,
  );
}

Map<String, dynamic> _$JWTTokenToJson(JWTToken instance) => <String, dynamic>{
      'result': instance.token,
    };
