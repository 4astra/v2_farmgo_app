import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:farm_go/theme/theme.dart';
import 'package:farm_go/weather/weather.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_repository/weather_repository.dart';
import 'package:authen_repository/authen_repository.dart';

class FarmGoApp extends StatelessWidget {
  const FarmGoApp(
      {Key? key,
      required WeatherRepository weatherRepository,
      required AuthenRepository authenRepository})
      : _weatherRepository = weatherRepository,
        _authenRepository = authenRepository,
        super(key: key);

  final WeatherRepository _weatherRepository;
  final AuthenRepository _authenRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authenRepository),
        RepositoryProvider.value(value: _weatherRepository),
      ],
      child: BlocProvider(
        create: (_) => ThemeCubit(),
        child: FarmGoAppView(),
      ),
    );
  }
}

class FarmGoAppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<ThemeCubit, Color>(
      builder: (context, color) {
        return MaterialApp(
          theme: ThemeData(
            primaryColor: color,
            textTheme: GoogleFonts.rajdhaniTextTheme(),
            appBarTheme: AppBarTheme(
              textTheme: GoogleFonts.rajdhaniTextTheme(textTheme).apply(
                bodyColor: Colors.white,
              ),
            ),
          ),
          home: WeatherPage(),
        );
      },
    );
  }
}
