import 'package:taqs/features/home/data/models/weather_model.dart';


abstract class WeatherRepository {
  Future<WeatherModel> getWeatherData(String location, int days);
}