import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';

import 'package:weather_app/services/weather_service.dart';

void main() {
  runApp(
      // ChangeNotifierProvider --> to provide data and listening (updata UI when data change )
      // provider --> to provide data
      BlocProvider(
          create: (BuildContext context) {
            return WeatherCubit(
              WeatherService(),
            );
          },
          child: MyApp()));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  WeatherModel? weather;

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel ==
                null
            ? Colors.blue
            : BlocProvider.of<WeatherCubit>(context).weatherModel!.getTheme(),
      ),
      home: HomePage(),
    );
  }
}
