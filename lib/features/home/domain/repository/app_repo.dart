import '../../../../config/network/dio.dart';
import '../../data/models/weather_model.dart';
import '../../data/repository/app_repository.dart';
import '../entities/weather_entity.dart';

class ImplWeatherRepository implements WeatherRepository {
  @override
  Future<WeatherEntity> getWeatherData(String location, int days) async {
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
        final forecastDays = weatherModel.forecast?.forecastday?.map((forecastDay) {
          return ForecastDayEntity(
            date: forecastDay.date!,
            maxTempC: forecastDay.day!.maxtempC!,
            minTempC: forecastDay.day!.mintempC!,
            avgTempC: forecastDay.day!.avgtempC!,
            conditionText: forecastDay.day!.condition!.text!,
          );
        }).toList() ?? [];

        return WeatherEntity(
          locationName: weatherModel.location!.name!,
          region: weatherModel.location!.region!,
          country: weatherModel.location!.country!,
          latitude: weatherModel.location!.lat!,
          longitude: weatherModel.location!.lon!,
          timeZoneId: weatherModel.location!.tzId!,
          localtime: weatherModel.location!.localtime!,
          currentTempC: weatherModel.current!.tempC!,
          currentConditionText: weatherModel.current!.condition!.text!,
          forecastDays: forecastDays,
        );
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to load weather data');
    }
  }
}