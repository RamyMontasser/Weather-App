class WeatherEntity {
  final String cityName;
  final double temp;
  final String condition;
  final int humidity;
  final double windSpeed;
  final double feelsLike;
  final int visibility;


  WeatherEntity({
    required this.cityName,
    required this.temp,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
    required this.feelsLike,
    required this.visibility, 
  });

}
