import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

@JsonSerializable()
class Account {
  const Account(
      {required this.id,
      required this.lastName,
      required this.middleName,
      required this.firstName,
      required this.gender,
      required this.birthday,
      required this.email,
      required this.phoneNumber,
      required this.isVerifiedEmail,
      required this.isVerifiedSocialNetwork,
      required this.createdAccountFrom,
      required this.status,
      required this.isDeleted,
      required this.lastLoginDate,
      required this.createdDate,
      required this.modifiedDate,
      required this.accountType,
      required this.isDeactived,
      required this.isBlocked,
      required this.blockedDate,
      required this.blockedDaysNumber,
      required this.qrCodeImageUrl,
      required this.countryCode,
      required this.countryName});

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  final BigInt id;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(name: 'middle_name')
  final String middleName;

  @JsonKey(name: 'first_name')
  final String firstName;

  final int gender;
  final DateTime birthday;
  final String email;

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'is_verified_email')
  final bool isVerifiedEmail;

  @JsonKey(name: 'is_verified_social_network')
  final bool isVerifiedSocialNetwork;

  @JsonKey(name: 'created_account_from')
  final String createdAccountFrom;

  final String status;

  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  @JsonKey(name: 'last_login_date')
  final DateTime lastLoginDate;

  @JsonKey(name: 'created_date')
  final DateTime createdDate;

  @JsonKey(name: 'modified_date')
  final DateTime modifiedDate;

  @JsonKey(name: 'account_type')
  final int accountType;

  @JsonKey(name: 'is_deactived')
  final bool isDeactived;

  @JsonKey(name: 'is_blocked')
  final bool isBlocked;

  @JsonKey(name: 'blocked_date')
  final DateTime blockedDate;

  @JsonKey(name: 'blocked_days_number')
  final int blockedDaysNumber;

  @JsonKey(name: 'qr_code_image_url')
  final bool qrCodeImageUrl;

  @JsonKey(name: 'country_code')
  final bool countryCode;

  @JsonKey(name: 'country_name')
  final bool countryName;
}
