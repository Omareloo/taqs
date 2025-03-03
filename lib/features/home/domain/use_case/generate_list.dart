import '../../data/models/weather_model.dart';
import '../../data/repository/genereate_list_repo.dart';

class GenerateListUseCase {

  final GenerateListRepo repository;
  GenerateListUseCase(this.repository);

  Future<List<int>> generate(WeatherModel weather) async {
    return await repository.generateList(weather);
  }
}