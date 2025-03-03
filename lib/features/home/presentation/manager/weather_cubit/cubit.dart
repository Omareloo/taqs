import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/config/constant/constant.dart';
import 'package:taqs/features/home/domain/use_case/generate_list.dart';
import 'package:taqs/features/home/domain/use_case/prediction_usecase.dart';
import 'package:taqs/features/home/presentation/manager/weather_cubit/states.dart';
import '../../../data/models/weather_model.dart';
import '../../../domain/use_case/get_weather_usecase.dart';
import 'failure_class.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  final GetPredictionUseCase getPredictionUseCase;
  final GenerateListUseCase generateListUseCase;

  final TextEditingController locationController = TextEditingController();
  final TextEditingController daysController = TextEditingController();

  static WeatherCubit get(context) => BlocProvider.of(context);

  int selectedDayIndex = 0;

  WeatherModel weather = WeatherModel();

  bool _isFetching = false;


  WeatherCubit(this.getWeatherUseCase, this.getPredictionUseCase, this.generateListUseCase) : super(WeatherInitial()){
    fetchWeather('Cairo', 3);
  }

  // get weather
  Future<void> fetchWeather(String location, int days) async {
    if (kDebugMode) {
      print('fetchWeather called');
    }
    if (_isFetching) {
      print('fetchWeather: Request already in progress, skipping.');
      return;
    }
    _isFetching = true;
    print('fetchWeather: _isFetching set to true');
    emit(WeatherLoading());
    print('WeatherLoading emitted');
    try {
      final weather = await getWeatherUseCase.execute(location, days);
      print('API call successful');
      if (!isClosed) {
        emit(WeatherSuccess(weather));
        print('WeatherSuccess emitted');
        await generateList(weather);
      } else {
        print('Cubit is closed, not emitting WeatherSuccess');
      }
    } on  Failure catch (failure) {
      print('API call failed: ${failure.toString()}');
      if (!isClosed) {
        emit(WeatherFailure(_mapFailureToMessage(failure)));
        print('WeatherFailure emitted');
      } else {
        print('Cubit is closed, not emitting WeatherFailure');
      }
    } catch (e) {
      print('Unexpected error: ${e.toString()}');
      if (!isClosed) {
        emit(WeatherFailure('Unexpected Error'));
        print('WeatherFailure emitted');
      } else {
        print('Cubit is closed, not emitting WeatherFailure');
      }
    } finally {
      _isFetching = false;
      print('fetchWeather: _isFetching set to false');
    }
  }


  // set day index
  void setDayIndex(int index) {
    selectedDayIndex = index;
    emit(WeatherSuccess(state is WeatherSuccess ? (state as WeatherSuccess).weatherModel : WeatherModel()));
  }

  Future<void> generateList(WeatherModel weather) async {
    print('_generateList called');
    if (!isClosed) {
      emit(GeneratedListLoading());
      try {
         features = await generateListUseCase.generateFeatures(weather);
        if (!isClosed) {
          emit(GeneratedListSuccess(features));
          await getPrediction(features);
        }
      } on Failure catch (failure) {
        if (!isClosed) {
          emit(GeneratedListFailure(_mapFailureToMessage(failure)));
        }
      } catch (e) {
        if (!isClosed) {
          emit(GeneratedListFailure('Unexpected Error'));
        }
      }
    }
  }

  Future<void> getPrediction(List<int> features) async {
    print('_getPrediction called');
    if (!isClosed) {
      emit(PredictionLoading());
      try {
        final prediction = await getPredictionUseCase.getPrediction(features);
        if (!isClosed) {
          emit(PredictionSuccess(prediction));
        }
      } on Failure catch (failure) {
        if (!isClosed) {
          emit(PredictionFailure(_mapFailureToMessage(failure)));
        }
      } catch (e) {
        if (!isClosed) {
          emit(PredictionFailure('Unexpected Error'));
        }
      }
    }
  }


  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unexpected Error';
    }
  }

  @override
  Future<void> close() {
    locationController.dispose();
    daysController.dispose();
    return super.close();
  }
}
