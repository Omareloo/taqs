import '../../domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getWeatherData(String location);
}