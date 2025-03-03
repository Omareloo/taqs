import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/features/home/domain/use_case/generate_list.dart';
import 'package:taqs/features/home/domain/use_case/prediction_usecase.dart';
import 'package:taqs/features/home/presentation/manager/weather_cubit/states.dart';
import '../../../data/models/weather_model.dart';
import '../../../domain/use_case/get_weather_usecase.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  final GetPredictionUseCase getPredictionUseCase;
  final GenerateListUseCase generateListUseCase;

  final TextEditingController locationController = TextEditingController();
  final TextEditingController daysController = TextEditingController();

  static WeatherCubit get(context) => BlocProvider.of(context);

  int selectedDayIndex = 0;

  List<int> features = [];

  List<int> prediction = [];




  WeatherModel weather = WeatherModel();

  WeatherCubit(this.getWeatherUseCase, this.getPredictionUseCase, this.generateListUseCase) : super(WeatherInitial()){
    fetchWeather('Cairo', 3);
  }

  Future<void> fetchWeather(String location, int days) async {
    emit(WeatherLoading());
    try {
      final weather = await getWeatherUseCase.execute(location, days);
      this.weather = weather;
      features = await generateListUseCase.generate(weather);
      prediction = await getPredictionUseCase.getPrediction(features);
      emit(WeatherSuccess(weather, prediction));
    } catch (e) {
      emit(WeatherFailure(e.toString()));// Debugging
    }
  }
  // set day index
  void setDayIndex(int index) {
    selectedDayIndex = index;
    emit(WeatherSuccess(state is WeatherSuccess ? (state as WeatherSuccess).weatherModel : WeatherModel(), state is WeatherSuccess ? (state as WeatherSuccess).prediction : []));
  }
}
