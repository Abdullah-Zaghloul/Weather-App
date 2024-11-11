import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

// ignore: must_be_immutable
class SuccessPage extends StatelessWidget {
   SuccessPage({
    super.key,
    required this.weatherData,
  });

   WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          weatherData!.getTheme(),
          weatherData!.getTheme()[300]!,
          weatherData!.getTheme()[100]!
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityName!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          Text(
            weatherData!.date,
            style: const TextStyle(fontSize: 18),
          ),
          const Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getImage()),
              Text(
                '${weatherData!.temp.toInt()}',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text('Max ${weatherData!.maxTemp.toInt()}'),
                  Text('Min ${weatherData!.minTemp.toInt()}'),
                ],
              ),
            ],
          ),
          const Spacer(flex: 1),
          Text(
            weatherData!.weatherState,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          const Spacer(flex: 5),
        ],
      ),
    );
  }
}
