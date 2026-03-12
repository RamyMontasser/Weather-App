import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/weather/domain/entity/weather_entity.dart';
import 'package:weather_app/features/weather/domain/repo.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  Repo repo;
  GetWeatherCubit(this.repo) : super(GetWeatherInitial());

  Future<void> getWeather({required String cityName})async{
    emit(GetWeatherLoading());
    var weather = await repo.getWeatherByCityName(cityName: cityName);
    weather.fold(
      (failure){
        emit(GetWeatherFailure(errMsg: failure.errMsg));
      }, 
      (weatherEntity){
        emit(GetWeatherSuccess(weatherEntity: weatherEntity));
      });
  }

  Future<void> getCurrentWeather()async{
    emit(CurrentWeatherLoading());
    var weather = await repo.getCurrentCityWeather();
    weather.fold(
      (failure){
        emit(CurrentWeatherFailure(errMsg: failure.errMsg));
      }, 
      (weatherEntity){
        emit(CurrentWeatherSuccess(weatherEntity: weatherEntity));
      });
  }
}
