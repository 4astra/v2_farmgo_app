import 'package:flutter/material.dart';
import 'package:farm_go/authen/authen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:farm_go/weather/weather.dart';

class LoginPage extends StatelessWidget {
  static Route route(LoginCubit weatherCubit) {
    return MaterialPageRoute<void>(
      fullscreenDialog: true,
      builder: (_) => BlocProvider.value(
        value: weatherCubit,
        child: LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                return Align(
                  // alignment: const Alignment(0, 100),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(16.0),
                          child: _UsernameInput()),
                      const Padding(padding: EdgeInsets.all(12)),
                      Padding(
                          padding: EdgeInsets.all(16), child: _PasswordInput()),
                      const Padding(padding: EdgeInsets.all(12)),
                      _LoginButton(),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
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
            // contentPadding: EdgeInsets.all(8),
            labelText: 'User name',
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
            // contentPadding: EdgeInsets.all(8),
            labelText: 'Password',
            errorText:
                state.loginDTO.password == null ? 'invalid password' : null,
            // enabledBorder: UnderlineInputBorder(
            //     borderSide: BorderSide(style: BorderStyle.none)),
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
          style: ElevatedButton.styleFrom(
            minimumSize: Size(120, 35),
          ),
          key: const Key('loginForm_continue_raisedButton'),
          child: const Text(
            'Login',
          ),
          onPressed: () => {
            // 1. Navigator pop and keep context
            // Navigator.of(context).popUntil((route) => route.isFirst)

            // 2. Navigator push new context
            Navigator.pushReplacement(context, WeatherPage.route())
          },
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
