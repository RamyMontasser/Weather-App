import 'package:dio/dio.dart';
import 'package:weather_app/core/service/weather_service.dart';

class ApiService extends WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';
  final String apiKey = '';
  

  ApiService({required this.dio});

  Future<dynamic> getCityWeather({required String cityName})async{
    var response = await dio.get('$baseUrl/weather?q=$cityName&appid=$apiKey&units=metric');
    return response;
  }
  
  @override
  Future getCurrentWeather({required double lat, required double lon}) async{
    var response = await dio.get('$baseUrl/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric');
    return response;
  }
}