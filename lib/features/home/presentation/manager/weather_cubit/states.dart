import 'package:taqs/features/home/data/models/weather_model.dart';


abstract class WeatherState {}

class WeatherInitial extends WeatherState {

}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;
  WeatherSuccess(this.weatherModel);
}

class WeatherFailure extends WeatherState {
  final String errorMessage;

  WeatherFailure(this.errorMessage);
}

class GeneratedListLoading extends WeatherState{}

class GeneratedListSuccess extends WeatherState
{
  final List<int> features;
  GeneratedListSuccess(this.features);
}

class GeneratedListFailure extends WeatherState
{
  final String errorMessage;
  GeneratedListFailure(this.errorMessage);
}



// prediction states

class PredictionLoading extends WeatherState {}

class PredictionSuccess extends WeatherState
{
  final int prediction;
  PredictionSuccess(this.prediction);
}

class PredictionFailure extends WeatherState
{
  final String errorMessage;
  PredictionFailure(this.errorMessage);
}