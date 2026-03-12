import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather/domain/entity/weather_entity.dart';

abstract class Repo {
  Future<Either<Failure, WeatherEntity>> getWeatherByCityName({required String cityName});
  Future<Either<Failure, WeatherEntity>> getCurrentCityWeather();
}