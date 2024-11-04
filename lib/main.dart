import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

void main() {
  runApp(
    // ChangeNotifierProvider --> to provide data and listening (updata UI when data change )
    // provider --> to provide data
    ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  WeatherModel? weather;

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
            ? Colors.blue
            : Provider.of<WeatherProvider>(context).weatherData!.getTheme(),
      ),
      home: HomePage(),
    );
  }
}
