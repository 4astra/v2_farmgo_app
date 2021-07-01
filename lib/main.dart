import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:farm_go/app.dart';
import 'package:farm_go/farm_go_bloc_observer.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_repository/weather_repository.dart';
import 'package:authen_repository/authen_repository.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = FarmGoBlocObserver();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(FarmGoApp(
    weatherRepository: WeatherRepository(),
    authenRepository: AuthenRepository(),
  ));
}