abstract class WeatherStates {}

class WeatherInitial extends WeatherStates {}

class WeatherLoading extends WeatherStates {}

class WeatherGetSuccess extends WeatherStates {}

class WeatherGetError extends WeatherStates {
  final String error;
  WeatherGetError(this.error);
}

