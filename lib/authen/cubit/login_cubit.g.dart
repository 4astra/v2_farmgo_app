// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginState _$LoginStateFromJson(Map<String, dynamic> json) {
  return LoginState(
    status: _$enumDecode(_$LoginStatusEnumMap, json['status']),
    loginDTO: json['loginDTO'] == null
        ? null
        : LoginDTO.fromJson(json['loginDTO'] as Map<String, dynamic>),
    token: json['token'] == null
        ? null
        : JWTToken.fromJson(json['token'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginStateToJson(LoginState instance) =>
    <String, dynamic>{
      'status': _$LoginStatusEnumMap[instance.status],
      'loginDTO': instance.loginDTO,
      'token': instance.token,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$LoginStatusEnumMap = {
  LoginStatus.initial: 'initial',
  LoginStatus.loading: 'loading',
  LoginStatus.success: 'success',
  LoginStatus.failure: 'failure',
};
