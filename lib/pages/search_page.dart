import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({super.key});

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
              cityName = data;
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;
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
                  BlocProvider.of<WeatherCubit>(context)
                      .getWeather(cityName: cityName!);
                  BlocProvider.of<WeatherCubit>(context).cityName = cityName;
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
