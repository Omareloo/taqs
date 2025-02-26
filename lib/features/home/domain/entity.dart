
import '../data/models/weather_model.dart';

class WeatherFeatures {
  static Current convertDayToCurrent(Day day) {
    return Current(
      tempC: day.avgtempC,
      isDay: 1,
      condition: day.condition,
      precipMm: day.totalprecipMm,
      windKph: day.maxwindKph,
    );
  }

  static List<int> getWeatherFeatures(WeatherModel weather, {Forecastday? forecastDay}) {
    List<int> features = [0, 0, 0, 0, 0];

    Current? current = weather.current;
    if (forecastDay != null) {
      if (forecastDay.day != null) {
        current = convertDayToCurrent(forecastDay.day!);
      }
    }

    if (current == null) {
      return features;
    }

    double tempC = current.tempC is double ? current.tempC : (current.tempC is int ? current.tempC.toDouble() : 0.0);
    double precipMm = current.precipMm is double ? current.precipMm : (current.precipMm is int ? current.precipMm.toDouble() : 0.0);
    double windKph = current.windKph is double ? current.windKph : (current.windKph is int ? current.windKph.toDouble() : 0.0);
    int isDay = current.isDay is int ? current.isDay : 0;
    String conditionText = current.condition?.text ?? "";

    if (tempC > 30) {
      features[0] = 1;
    }
    if (tempC < 10) {
      features[1] = 1;
    }
    if (precipMm > 1) {
      features[2] = 1;
    }
    if (windKph > 30) {
      features[3] = 1;
    }
    if (isDay == 1 &&
        !conditionText.toLowerCase().contains("rain") &&
        !conditionText.toLowerCase().contains("snow")) {
      features[4] = 1;
    }
    return features;
  }
}