class WeatherEntity {
  final String cityName;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String description;
  final int humidity;
  final double windSpeed;
  final double feelsLike;
  final int visibility;


  WeatherEntity({
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

}
