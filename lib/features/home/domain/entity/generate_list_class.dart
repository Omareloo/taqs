import '../../data/models/weather_model.dart';

class WeatherFeatures {
  static List<int> createBinaryList(
      List<double> data, List<double> thresholds, List<bool Function(double, double)> conditions) {
    assert(data.length == thresholds.length);
    assert(data.length == conditions.length);

    List<int> binaryList = [];
    for (int i = 0; i < data.length; i++) {
      if (conditions[i](data[i], thresholds[i])) {
        binaryList.add(1);
      } else {
        binaryList.add(0);
      }
    }
    return binaryList;
  }

  static List<int> getWeatherFeatures(WeatherModel weather, {Forecastday? forecastDay}) {
    Current current = forecastDay?.day != null ? convertDayToCurrent(forecastDay!.day!) : weather.current!;

    double tempC = current.tempC?.toDouble() ?? 0.0;
    double precipMm = current.precipMm?.toDouble() ?? 0.0;
    double windKph = current.windKph?.toDouble() ?? 0.0;
    int isDay = current.isDay ?? 0;
    double humidity = current.humidity?.toDouble() ?? 0.0;

    List<double> thresholds = [tempC, precipMm, windKph, humidity, isDay.toDouble()];
    List<bool Function(double, double)> conditions = [
          (data, threshold) => data > threshold, // temp > 30
          (data, threshold) => data > threshold, // wind > 20
          (data, threshold) => data > threshold, // precip > 0
          (data, threshold) => data > threshold, // humidity > 70
          (data, threshold) => data > threshold, // isDay > 0
    ];

    List<double> data = [tempC, windKph, precipMm, humidity, isDay.toDouble()];
    return createBinaryList(data, thresholds, conditions);
  }
  static Current convertDayToCurrent(Day day) {
    return Current(
        tempC: day.avgtempC,
        tempF: day.avgtempF,
        windKph: day.maxwindKph,
        precipMm: day.totalprecipMm,
        humidity: null,
        isDay: null
    );
  }
}