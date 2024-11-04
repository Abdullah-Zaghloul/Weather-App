import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      // ========================================= AppBar and Search Icon =========================================
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
      body:
          // ========================================= No Data Page =========================================
          weatherData == null
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'there is no weather data😔',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'searching now🔍',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                )
              // ========================================= Weather Page Ui =========================================
              : Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    weatherData!.getTheme(),
                    weatherData!.getTheme()[300]!,
                    weatherData!.getTheme()[100]!
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 3),
                      Text(
                        Provider.of<WeatherProvider>(context).cityName!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
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
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
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
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                      const Spacer(flex: 5),
                    ],
                  ),
                ),
    );
  }
}
