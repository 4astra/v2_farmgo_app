import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:farm_go/search/search.dart';
import 'package:farm_go/settings/settings.dart';
import 'package:farm_go/theme/theme.dart';
import 'package:farm_go/weather/weather.dart';
import 'package:pedantic/pedantic.dart';
import 'package:weather_repository/weather_repository.dart';
import 'package:farm_go/authen/authen.dart';
import 'package:authen_repository/authen_repository.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => WeatherCubit(context.read<WeatherRepository>()),
    //   child: WeatherView(),
    // );

    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => WeatherCubit(context.read<WeatherRepository>()),
      ),
      BlocProvider(
        create: (context) => LoginCubit(context.read<AuthenRepository>()),
      ),
    ], child: WeatherView());
  }
}

class WeatherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.login),
          // onPressed: () {
          //   Navigator.of(context).push<void>(LoginPage.route(
          //     context.read<LoginCubit>(),
          //   ));
          // },
          onPressed: () async {
            // final city = await Navigator.of(context).push(LoginPage.route());
            // print('City: $city');
            // unawaited(context.read<WeatherCubit>().fetchWeather(city));

            Navigator.of(context).push<void>(LoginPage.route(
              context.read<LoginCubit>(),
            ));
          },
        ),
        title: const Text('Flutter Weather'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push<void>(SettingsPage.route(
                context.read<WeatherCubit>(),
              ));
            },
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              context.read<ThemeCubit>().updateTheme(state.weather);
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case WeatherStatus.initial:
                return const WeatherEmpty();
              case WeatherStatus.loading:
                return const WeatherLoading();
              case WeatherStatus.success:
                return WeatherPopulated(
                  weather: state.weather,
                  units: state.temperatureUnits,
                  onRefresh: () {
                    return context.read<WeatherCubit>().refreshWeather();
                  },
                );
              case WeatherStatus.failure:
              default:
                return const WeatherError();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () async {
          final city = await Navigator.of(context).push(SearchPage.route());
          unawaited(context.read<WeatherCubit>().fetchWeather(city));
        },
      ),
    );
  }
}
