abstract class WeatherService {

  Future<dynamic> getCityWeather({required String cityName});
  Future<dynamic> getCurrentWeather({required double lat, required double lon});
}