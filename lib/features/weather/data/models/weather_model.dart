import 'package:weather_app/features/weather/domain/entity/weather_entity.dart';

class WeatherModel {
  final String cityName;
  final double temp;
  final String condition;
  final int humidity;
  final double windSpeed;
  final double feelsLike;
  final int visibility;

  WeatherModel({
    required this.cityName,
    required this.temp,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
    required this.feelsLike,
    required this.visibility,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temp: json['main']['temp'].toDouble(),
      condition: json['weather'][0]['main'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      visibility: json['visibility'],
    );
  }

  WeatherEntity toEntity() {
    return WeatherEntity(
      cityName: cityName,
      temp: temp,
      condition: condition,
      humidity: humidity,
      windSpeed: windSpeed,
      feelsLike: feelsLike,
      visibility: visibility,
    );
  }
}
