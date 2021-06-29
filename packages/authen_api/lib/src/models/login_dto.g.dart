// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDTO _$LoginDTOFromJson(Map<String, dynamic> json) {
  return LoginDTO(
    email: json['email'] as String,
    phoneNumber: json['phone_number'] as String,
    password: json['password'] as String,
    loginType: json['login_type'] as String,
  );
}

Map<String, dynamic> _$LoginDTOToJson(LoginDTO instance) => <String, dynamic>{
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'password': instance.password,
      'login_type': instance.loginType,
    };
