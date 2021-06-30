import 'package:json_annotation/json_annotation.dart';
part 'jwt_token.g.dart';

@JsonSerializable()
class JWTToken {
  const JWTToken({required this.token});

  factory JWTToken.fromJson(Map<String, dynamic> json) =>
      _$JWTTokenFromJson(json);

  Map<String, dynamic> toJson() => _$JWTTokenToJson(this);    

  static final empty = JWTToken(
    token: '',
  );

  @JsonKey(name: "result")
  final String? token;
}
