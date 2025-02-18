// weather_entity.dart
class WeatherEntity {
  final String locationName;
  final String region;
  final String country;
  final double latitude;
  final double longitude;
  final String timeZoneId;
  final String localtime;
  final double currentTempC;
  final String currentConditionText;
  final List<ForecastDayEntity> forecastDays;

  WeatherEntity({
    required this.locationName,
    required this.region,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.timeZoneId,
    required this.localtime,
    required this.currentTempC,
    required this.currentConditionText,
    required this.forecastDays,
  });
}

class ForecastDayEntity {
  final String date;
  final double maxTempC;
  final double minTempC;
  final double avgTempC;
  final String conditionText;

  ForecastDayEntity({
    required this.date,
    required this.maxTempC,
    required this.minTempC,
    required this.avgTempC,
    required this.conditionText,
  });
}