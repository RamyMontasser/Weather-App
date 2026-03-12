part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {}

final class GetWeatherInitial extends GetWeatherState {}
final class GetWeatherLoading extends GetWeatherState {}
final class GetWeatherSuccess extends GetWeatherState {
  final WeatherEntity weatherEntity;

  GetWeatherSuccess({required this.weatherEntity});
}
final class GetWeatherFailure extends GetWeatherState {
  final String errMsg;

  GetWeatherFailure({required this.errMsg});
}


final class CurrentWeatherLoading extends GetWeatherState {}
final class CurrentWeatherSuccess extends GetWeatherState {
  final WeatherEntity weatherEntity;

  CurrentWeatherSuccess({required this.weatherEntity});
}
final class CurrentWeatherFailure extends GetWeatherState {
  final String errMsg;

  CurrentWeatherFailure({required this.errMsg});
}
