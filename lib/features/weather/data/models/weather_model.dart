import 'package:weather_app/features/weather/domain/entity/weather_entity.dart';

class WeatherModel {
  final String cityName;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String description;
  final int humidity;
  final double windSpeed;
  final double feelsLike;
  final int visibility;

  WeatherModel({
    required this.cityName,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.feelsLike,
    required this.visibility,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temp: json['main']['temp'].toDouble(),
      tempMin: json['main']['temp_min'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      description: json['weather'][0]['main'],
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
      description: description,
      humidity: humidity,
      windSpeed: windSpeed,
      feelsLike: feelsLike,
      visibility: visibility, 
      tempMin: tempMin, 
      tempMax: tempMax,
    );
  }
}
