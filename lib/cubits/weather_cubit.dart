import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(InitialState());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;
  void getWeather({required String cityName}) async {
    emit(LoadingState());

    weatherModel = await weatherService.getWeather(cityName: cityName);
    if (weatherModel != null) {
      emit(SuccessState());
    } else {
      emit(FailureState());
    }
  }
}
