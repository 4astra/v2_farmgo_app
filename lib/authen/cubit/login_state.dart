part of 'login_cubit.dart';

enum LoginStatus { initial, loading, success, failure }

@JsonSerializable()
class LoginState extends Equatable {
  LoginState({
    this.status = LoginStatus.initial,
    LoginDTO? loginDTO,
    JWTToken? token,
  })  : loginDTO = LoginDTO.empty,
        token = JWTToken.empty;

  factory LoginState.fromJson(Map<String, dynamic> json) =>
      _$LoginStateFromJson(json);

  

  LoginState copyWith({
    LoginStatus? status,
    LoginDTO? loginDTO,
    JWTToken? token,
  }) {
    return LoginState(
        status: status ?? this.status,
        loginDTO: loginDTO ?? this.loginDTO,
        token: token ?? this.token);
  }

  Map<String, dynamic> toJson() => _$LoginStateToJson(this);

  @override
  List<Object?> get props => [status, loginDTO, token];

  final LoginStatus status;
  final LoginDTO loginDTO;
  final JWTToken token;
}
