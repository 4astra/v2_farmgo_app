import 'package:flutter/material.dart';
import 'package:farm_go/authen/authen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  static Route route(LoginCubit weatherCubit) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: weatherCubit,
        child: LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ListView(
        children: <Widget>[
          BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              return Align(
                alignment: const Alignment(0, 100),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _UsernameInput(),
                    const Padding(padding: EdgeInsets.all(12)),
                    _PasswordInput(),
                    const Padding(padding: EdgeInsets.all(12)),
                    _LoginButton(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.loginDTO != previous.loginDTO,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) => {print('object: $username')},
          // context.read<LoginCubit>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            labelText: 'username',
            errorText: state.loginDTO.email == null ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.loginDTO != current.loginDTO,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) => {print('object: $password')},
          // context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'password',
            errorText:
                state.loginDTO.password == null ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('loginForm_continue_raisedButton'),
          child: const Text('Login'),
          onPressed: () => {},
        );
        // return state.status.isSubmissionInProgress
        //     ? const CircularProgressIndicator()
        //     : ElevatedButton(
        //         key: const Key('loginForm_continue_raisedButton'),
        //         child: const Text('Login'),
        //         onPressed: state.status.isValidated
        //             ? () {
        //                 context.read<LoginBloc>().add(const LoginSubmitted());
        //               }
        //             : null,
        //       );
      },
    );
  }
}
