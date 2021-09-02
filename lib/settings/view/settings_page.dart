import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:farm_go/weather/weather.dart';

class SettingsPage extends StatelessWidget {
  static Route route(WeatherCubit weatherCubit) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: weatherCubit,
        child: SettingsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: <Widget>[
          BlocBuilder<WeatherCubit, WeatherState>(
            buildWhen: (previous, current) =>
                previous.temperatureUnits != current.temperatureUnits,
            builder: (context, state) {
              return MyListTile();
              // ListTile(
              //   title: const Text('Temperature Units'),
              //   isThreeLine: true,
              //   subtitle: const Text(
              //     'Use metric measurements for temperature units.',
              //   ),
              //   trailing: Switch(
              //     value: state.temperatureUnits.isCelsius,
              //     onChanged: (_) => context.read<WeatherCubit>().toggleUnits(),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      // color: const Color(0xff0087a8),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 70,
            child: Container(
              color: Colors.lightBlue[400],
            ),
          ),
          Expanded(
            flex: 30,
            child: Container(
              color: Colors.deepPurple[800],
            ),
          )
        ],
      ),
    );
  }
}
