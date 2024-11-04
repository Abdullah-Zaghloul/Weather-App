import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body:
          // ========================================= Search Page and TextField Widget =========================================
          Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              WeatherService service = WeatherService();
              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              label: const Text('Search'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              hintText: 'Enter a city',
              border: const OutlineInputBorder(),
              // ============== Search Icon ==============
              suffixIcon: GestureDetector(
                child: const Icon(Icons.search),
                onTap: () async {
                  WeatherService service = WeatherService();
                  WeatherModel? weather = await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
