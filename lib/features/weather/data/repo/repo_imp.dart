import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/service/location_service.dart';
import 'package:weather_app/core/service/weather_service.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/domain/entity/weather_entity.dart';
import 'package:weather_app/features/weather/domain/repo.dart';

class RepoImp implements Repo{
  WeatherService weatherService;
  final LocationService locationService;

  RepoImp({required this.weatherService, required this.locationService});
  @override
  Future<Either<Failure, WeatherEntity>> getWeatherByCityName({required String cityName}) async{
    try {
      var response = await weatherService.getCityWeather(cityName: cityName);
      WeatherEntity weatherEntity = WeatherModel.fromJson(response).toEntity();
      return right(weatherEntity);
    } on DioException catch(e){
      return left(ApiFailure.fromDioException(e));
    }
    catch (e) {
      return left(ApiFailure(errMsg: e.toString()));
    }
    
  }
  
  @override
  Future<Either<Failure, WeatherEntity>> getCurrentCityWeather() async{
    try {
      Position position = await locationService.determinePosition();
      var response = await weatherService.getCurrentWeather(lat: position.latitude, lon: position.longitude);
      WeatherEntity weatherEntity = WeatherModel.fromJson(response).toEntity();
      return right(weatherEntity);
    } on DioException catch(e){
      return left(ApiFailure.fromDioException(e));
    }
    catch (e) {
      return left(ApiFailure(errMsg: e.toString()));
    }
  }
}