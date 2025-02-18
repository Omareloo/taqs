import '../../../domain/entities/weather_entity.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherEntity weatherEntity;

  WeatherSuccess(this.weatherEntity);
}

class WeatherFailure extends WeatherState {
  final String errorMessage;

  WeatherFailure(this.errorMessage);
}