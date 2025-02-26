import '../../data/models/weather_model.dart';

abstract class GenerateListRepo {
  Future<List<int>> generateFeatures(WeatherModel weather);
}