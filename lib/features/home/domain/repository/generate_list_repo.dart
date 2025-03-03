import '../../data/models/weather_model.dart';
import '../../data/repository/genereate_list_repo.dart';
import '../entity/generate_list_class.dart';

class ImplGenerateListRepository implements GenerateListRepo {
  @override
  Future<List<int>> generateList(WeatherModel weather) async {
    return WeatherFeatures.getWeatherFeatures(weather);
  }
}