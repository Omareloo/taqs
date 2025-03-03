import 'package:taqs/features/home/data/models/weather_model.dart';

import '../../data/repository/app_repository.dart';

class GetWeatherUseCase {

  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<WeatherModel> execute(String location, int days) async{
    return await repository.getWeatherData(location, days);
  }
}