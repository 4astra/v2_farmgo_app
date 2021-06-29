// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    id: BigInt.parse(json['id'] as String),
    lastName: json['last_name'] as String,
    middleName: json['middle_name'] as String,
    firstName: json['first_name'] as String,
    gender: json['gender'] as int,
    birthday: DateTime.parse(json['birthday'] as String),
    email: json['email'] as String,
    phoneNumber: json['phone_number'] as String,
    isVerifiedEmail: json['is_verified_email'] as bool,
    isVerifiedSocialNetwork: json['is_verified_social_network'] as bool,
    createdAccountFrom: json['created_account_from'] as String,
    status: json['status'] as String,
    isDeleted: json['is_deleted'] as bool,
    lastLoginDate: DateTime.parse(json['last_login_date'] as String),
    createdDate: DateTime.parse(json['created_date'] as String),
    modifiedDate: DateTime.parse(json['modified_date'] as String),
    accountType: json['account_type'] as int,
    isDeactived: json['is_deactived'] as bool,
    isBlocked: json['is_blocked'] as bool,
    blockedDate: DateTime.parse(json['blocked_date'] as String),
    blockedDaysNumber: json['blocked_days_number'] as int,
    qrCodeImageUrl: json['qr_code_image_url'] as bool,
    countryCode: json['country_code'] as bool,
    countryName: json['country_name'] as bool,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id.toString(),
      'last_name': instance.lastName,
      'middle_name': instance.middleName,
      'first_name': instance.firstName,
      'gender': instance.gender,
      'birthday': instance.birthday.toIso8601String(),
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'is_verified_email': instance.isVerifiedEmail,
      'is_verified_social_network': instance.isVerifiedSocialNetwork,
      'created_account_from': instance.createdAccountFrom,
      'status': instance.status,
      'is_deleted': instance.isDeleted,
      'last_login_date': instance.lastLoginDate.toIso8601String(),
      'created_date': instance.createdDate.toIso8601String(),
      'modified_date': instance.modifiedDate.toIso8601String(),
      'account_type': instance.accountType,
      'is_deactived': instance.isDeactived,
      'is_blocked': instance.isBlocked,
      'blocked_date': instance.blockedDate.toIso8601String(),
      'blocked_days_number': instance.blockedDaysNumber,
      'qr_code_image_url': instance.qrCodeImageUrl,
      'country_code': instance.countryCode,
      'country_name': instance.countryName,
    };
