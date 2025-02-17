import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/features/home/presentation/manager/weather_cubit/states.dart';
import '../../../domain/use_case/get_weather_usecase.dart';


class WeatherCubit extends Cubit<WeatherStates> {
  final GetWeatherUseCase _getWeatherUseCase;

  WeatherCubit(this._getWeatherUseCase) : super(WeatherInitial());

  Future<void> getWeatherData(String location) async {
    emit(WeatherLoading());
    try {
      final weather = await _getWeatherUseCase.execute(location);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError('Failed to load weather data'));
    }
  }
  @override
  Future<void> close() {
    return super.close();
  }

}