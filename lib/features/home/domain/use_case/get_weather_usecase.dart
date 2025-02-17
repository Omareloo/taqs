// get_weather_use_case.dart

import '../../data/repository/app_repository.dart';
import '../entities/weather_entity.dart';

class GetWeatherUseCase {
  final WeatherRepository _weatherRepository;

  GetWeatherUseCase(this._weatherRepository);

  Future<WeatherEntity> execute(String location) async {
    return await _weatherRepository.getWeatherData(location);
  }
}