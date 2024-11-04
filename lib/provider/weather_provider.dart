import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
// extends (ChangeNotifier) to could update ui 
class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? cityName;
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    // from ChangeNotifier
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
