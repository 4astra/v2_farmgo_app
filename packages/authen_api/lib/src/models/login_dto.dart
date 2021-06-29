import 'package:json_annotation/json_annotation.dart';
part 'login_dto.g.dart';

@JsonSerializable()
class LoginDTO {
  const LoginDTO(
      {required this.email,
      required this.phoneNumber,
      required this.password,
      required this.loginType});

  factory LoginDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDTOToJson(this);

  @JsonKey(name: "email")
  final String email;

  @JsonKey(name: "phone_number")
  final String phoneNumber;

  @JsonKey(name: "password")
  final String password;

  @JsonKey(name: "login_type")
  final String loginType;
}
