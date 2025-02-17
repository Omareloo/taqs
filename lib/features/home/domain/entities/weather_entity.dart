class WeatherEntity {
  final String locationName;
  final String region;
  final String country;
  final double temperatureCelsius;
  final double windKph;
  final int pressureMb;
  final String conditionText;
  final String conditionIcon;

  WeatherEntity({
    required this.locationName,
    required this.region,
    required this.country,
    required this.temperatureCelsius,
    required this.windKph,
    required this.pressureMb,
    required this.conditionText,
    required this.conditionIcon,
  });
}