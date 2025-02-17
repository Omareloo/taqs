import '../../../domain/entities/weather_entity.dart';

abstract class WeatherStates {
  const WeatherStates();
}

class WeatherInitial extends WeatherStates {}

class WeatherLoading extends WeatherStates {}

class WeatherLoaded extends WeatherStates {
  final WeatherEntity weather;
  const WeatherLoaded(this.weather);
}

class WeatherError extends WeatherStates {
  final String message;

  const WeatherError(this.message);
}