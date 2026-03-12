import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/weather/domain/entity/weather_entity.dart';
import 'package:weather_app/features/weather/presentation/cubit/get_weather_cubit.dart';
import 'package:weather_app/features/weather/presentation/widgets/failure_body.dart';
import 'package:weather_app/features/weather/presentation/widgets/success_body.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
    required this.success,
    this.errMsg,
    this.weatherEntity,
  });
  final bool success;
  final String? errMsg;
  final WeatherEntity? weatherEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF111031), Color(0xFF1D1B4B)],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      context.read<GetWeatherCubit>().getWeather(
                        cityName: value,
                      );
                    }
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 30),
              Expanded(
                child: success && weatherEntity != null
                    ? SuccessBody(weatherEntity: weatherEntity!)
                    : FailureBody(errMsg: errMsg ?? 'Search a city'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
