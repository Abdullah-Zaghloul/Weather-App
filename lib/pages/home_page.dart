import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/cubits/weather_state.dart';

import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/default_page.dart';
import 'package:weather_app/pages/failure_Page.dart';
import 'package:weather_app/pages/success_page.dart';
import 'package:weather_app/pages/search_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:
            weatherData == null ? Colors.blue : weatherData!.getTheme(),
        actions: [
          IconButton.outlined(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SearchPage();
                  }),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SuccessState) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;

            return SuccessPage(weatherData: weatherData);
          } else if (state is FailureState) {
            return const FailurePage();
          } else {
            return const DefaultPage();
          }
        },
      ),
    );
  }
}

