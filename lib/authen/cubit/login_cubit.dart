import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:authen_api/authen_api.dart';
import 'package:authen_repository/authen_repository.dart';
part 'login_cubit.g.dart';
part 'login_state.dart';


class LoginCubit extends HydratedCubit<LoginState> {
  LoginCubit(this._authenRepository) : super(LoginState());

  final AuthenRepository _authenRepository;

  Future<void> doLogin(LoginDTO? loginDTO) async {
    if (loginDTO == null) return;

    emit(state.copyWith(status: LoginStatus.loading));

    try {
      
      final token = await _authenRepository.login(loginDTO);
      
      emit(
        state.copyWith(
          status: LoginStatus.success,
          token: token,
          loginDTO: loginDTO,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }

  @override
  LoginState fromJson(Map<String, dynamic> json) =>
      LoginState.fromJson(json);

  @override
  Map<String, dynamic> toJson(LoginState state) => state.toJson();
}
