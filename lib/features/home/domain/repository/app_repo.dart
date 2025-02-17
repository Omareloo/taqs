import '../../../../config/network/dio.dart';
import '../../data/models/weather_model.dart';
import '../../data/repository/app_repository.dart';
import '../entities/weather_entity.dart';

class ImplWeatherRepository implements WeatherRepository {
  @override
  Future<WeatherEntity> getWeatherData(String location) async {
    try {
      final response = await DioHelper.getData(
        url: '/current.json',
        query: {'q': location},
      );
      if (response.statusCode == 200) {
        final WeatherModel weatherModel =
        WeatherModel.fromJson(response.data);
        return WeatherEntity(
          locationName: weatherModel.location!.name!,
          region: weatherModel.location!.region!,
          country: weatherModel.location!.country!,
          temperatureCelsius: weatherModel.current!.tempC!,
          windKph: weatherModel.current!.windKph!,
          pressureMb: weatherModel.current!.pressureMb!,
          conditionText: weatherModel.current!.condition!.text!,
          conditionIcon: 'https:${weatherModel.current!.condition!.icon!}',
        );
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to load weather data');
    }
  }
}