import '../../data/models/weather_model.dart';
import '../../data/repository/genereate_list_repo.dart';
import '../entity.dart';


class ImplGenerateListRepository implements GenerateListRepo {
  @override
  Future<List<int>> generateFeatures(WeatherModel weather) async {
    return WeatherFeatures.getWeatherFeatures(weather);
  }
}