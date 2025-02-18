import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/features/home/presentation/manager/weather_cubit/states.dart';


import '../../../domain/use_case/get_weather_usecase.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherCubit(this.getWeatherUseCase) : super(WeatherInitial());

  Future<void> fetchWeather(String location, int days) async {
    emit(WeatherLoading());
    try {
      final weatherEntity = await getWeatherUseCase.execute(location, days);
      emit(WeatherSuccess(weatherEntity));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}