import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/features/home/presentation/manager/weather_cubit/states.dart';


import '../../../data/models/weather_model.dart';
import '../../../domain/use_case/get_weather_usecase.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;

  final TextEditingController locationController = TextEditingController();
  final TextEditingController daysController = TextEditingController();

  static WeatherCubit get(context) => BlocProvider.of(context);


  WeatherCubit(this.getWeatherUseCase) : super(WeatherInitial()){
    fetchWeather('Cairo', 3);
  }

  int selectedDayIndex = 0;



  Future<void> fetchWeather(String location, int days) async {
    emit(WeatherLoading());
    try {
      final weather = await getWeatherUseCase.execute(location, days);
      emit(WeatherSuccess(weather));
    } catch (e) {
      emit(WeatherFailure(e.toString()));// Debugging
    }
  }
  void setDayIndex(int index) {
    selectedDayIndex = index;
    emit(WeatherSuccess(state is WeatherSuccess ? (state as WeatherSuccess).weatherModel : WeatherModel()));
  }

  @override
  Future<void> close() {
    locationController.dispose();
    daysController.dispose();
    return super.close();
  }
}
