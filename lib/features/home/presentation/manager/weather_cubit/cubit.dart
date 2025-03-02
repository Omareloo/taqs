import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/features/home/domain/use_case/generate_list.dart';
import 'package:taqs/features/home/domain/use_case/prediction_usecase.dart';
import 'package:taqs/features/home/presentation/manager/weather_cubit/states.dart';
import '../../../../../config/constant/constant.dart';
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

  WeatherModel weather = WeatherModel();

  WeatherCubit(this.getWeatherUseCase, this.getPredictionUseCase, this.generateListUseCase) : super(WeatherInitial()){
    fetchWeather('Cairo', 3);
  }

  // get weather
  Future<void> fetchWeather(String location, int days) async {
    emit(WeatherLoading());
    try {
      weather = await getWeatherUseCase.execute(location, days);
      emit(WeatherSuccess(weather));
      generateFeatures();
    } catch (e) {
      emit(WeatherFailure(e.toString()));// Debugging
    }
  }

  // set day index
  void setDayIndex(int index) {
    selectedDayIndex = index;
    emit(WeatherSuccess(state is WeatherSuccess ? (state as WeatherSuccess).weatherModel : WeatherModel()));
  }

  Future<void> generateFeatures() async {
    emit(GeneratedListLoading());
    try {
      features = await generateListUseCase.generateFeatures(weather);
      emit(GeneratedListSuccess(features));
      getPrediction();
    } catch (e) {
      emit(GeneratedListFailure(e.toString()));
    }
  }

  // get prediction
  Future<void> getPrediction() async {
    emit(PredictionLoading());
    try {
      final prediction = await getPredictionUseCase.getPrediction(features);
      emit(PredictionSuccess(prediction));
    } catch (e) {
      emit(PredictionFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    locationController.dispose();
    daysController.dispose();
    return super.close();
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:taqs/features/home/domain/use_case/generate_list.dart';
// import 'package:taqs/features/home/domain/use_case/prediction_usecase.dart';
// import 'package:taqs/features/home/presentation/manager/weather_cubit/states.dart';
//
//
// import '../../../data/models/weather_model.dart';
// import '../../../domain/use_case/get_weather_usecase.dart';
// import 'const.dart';
//
// class WeatherCubit extends Cubit<WeatherState> {
//
//   final GetWeatherUseCase getWeatherUseCase;
//   final GetPredictionUseCase getPredictionUseCase;
//   final GenerateListUseCase generateListUseCase;
//
//   final TextEditingController locationController = TextEditingController();
//   final TextEditingController daysController = TextEditingController();
//
//   static WeatherCubit get(context) => BlocProvider.of(context);
//
//   int selectedDayIndex = 0;
//
//
//   WeatherModel weather = WeatherModel();
//
//   WeatherCubit(this.getWeatherUseCase, this.getPredictionUseCase, this.generateListUseCase) : super(WeatherInitial()){
//     fetchWeather('Cairo', 3);
//   }
//
//   // get weather
//   Future<void> fetchWeather(String location, int days) async {
//     emit(WeatherLoading());
//     try {
//       weather = await getWeatherUseCase.execute(location, days);
//       emit(WeatherSuccess(weather));
//     } catch (e) {
//       emit(WeatherFailure(e.toString()));// Debugging
//     }
//   }
//
//   // set day index
//   void setDayIndex(int index) {
//     selectedDayIndex = index;
//     emit(WeatherSuccess(state is WeatherSuccess ? (state as WeatherSuccess).weatherModel : WeatherModel()));
//   }
//
//
//   Future<void> generateFeatures() async {
//     emit(GeneratedListLoading());
//     try {
//       features = await generateListUseCase.generateFeatures(weather);
//       emit(GeneratedListSuccess(features));
//     } catch (e) {
//       emit(GeneratedListFailure(e.toString()));
//     }
//   }
//
//   // get prediction
//   Future<void> getPrediction() async {
//     emit(PredictionLoading());
//     try {
//       final prediction = await getPredictionUseCase.getPrediction(features);
//       emit(PredictionSuccess(prediction));
//     } catch (e) {
//       emit(PredictionFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<void> close() {
//     locationController.dispose();
//     daysController.dispose();
//     return super.close();
//   }
// }
