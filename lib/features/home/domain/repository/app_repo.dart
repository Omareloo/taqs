import '../../../../config/network/dio.dart';
import '../../data/models/weather_model.dart';
import '../../data/repository/app_repository.dart';

class ImplWeatherRepository implements WeatherRepository {
  @override
  Future<WeatherModel> getWeatherData(String location, int days) async {
    try {
      final response = await DioHelper.getData(
        url: 'forecast.json',
        query: {
          'q': location,
          'days': days,
        },
      );
      if (response.statusCode == 200) {
        final weatherModel = WeatherModel.fromJson(response.data);
        return weatherModel;
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to load weather data');
    }
  }
}