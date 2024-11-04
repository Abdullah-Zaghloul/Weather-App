import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherState;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherState});
//  named constructor to create an objet of WeatherModel and set data types directly
// factory -> constructor return a value (object of weatherModel)
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      date: data['location']['localtime'],
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherState: jsonData['condition']['text'],
    );
  }
  @override
  String toString() {
    return 'date = $date    temp = $temp    maxTemp = $maxTemp    minTemp = $minTemp    weatherState = $weatherState';
  }

  String getImage() {
    switch (weatherState) {
      case 'Thunderstorm':
        return 'assets/images/thunderstorm.png';
      case 'Snow':
      case 'Hail':
        return 'assets/images/snow.png';
      case 'Clear':
      case 'Sunny':
      case 'Light Cloud':
        return 'assets/images/clear.png';
      case 'Heavy Rain':
      case 'Light Rain':
      case 'Showers':
        return 'assets/images/rainy.png';
      default:
        return 'assets/images/clear.png';
    }
  }

  MaterialColor getTheme() {
    if (weatherState == 'Sunny' || weatherState == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherState == 'Sleet' ||
        weatherState == 'Snow' ||
        weatherState == 'Hail') {
      return Colors.blue;
    } else if (weatherState == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else {
      return Colors.amber;
    }
  }
}
