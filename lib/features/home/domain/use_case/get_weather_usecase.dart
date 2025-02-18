import '../../data/repository/app_repository.dart';
import '../entities/weather_entity.dart';

class GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<WeatherEntity> execute(String location, int days) {
    return repository.getWeatherData(location, days);
  }
}