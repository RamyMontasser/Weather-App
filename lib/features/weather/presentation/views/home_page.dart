import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weather_app/core/service/getit.dart';
import 'package:weather_app/features/weather/domain/entity/weather_entity.dart';
import 'package:weather_app/features/weather/domain/repo.dart';
import 'package:weather_app/features/weather/presentation/cubit/get_weather_cubit.dart';
import 'package:weather_app/features/weather/presentation/views/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(getIt<Repo>())..getCurrentWeather(),
      child: Scaffold(
        body: 
        // HomePageBody(success: true)
        BlocBuilder<GetWeatherCubit, GetWeatherState>(
         builder: (context, state) {
                bool isLoading =
                    state is CurrentWeatherLoading ||
                    state is GetWeatherLoading;

                bool isSuccess =
                    state is CurrentWeatherSuccess ||
                    state is GetWeatherSuccess;

                String? errMsg;
                WeatherEntity? weatherEntity;

                if (state is CurrentWeatherFailure){
                  errMsg = state.errMsg;
                }else if (state is GetWeatherFailure){
                  errMsg = state.errMsg;
                }else if (state is CurrentWeatherSuccess){
                  weatherEntity = state.weatherEntity;
                } else if (state is GetWeatherSuccess){
                  weatherEntity = state.weatherEntity;
                }

                
                return ModalProgressHUD(
                  inAsyncCall: isLoading,
                  child: HomePageBody(
                    success: isSuccess,
                    errMsg: errMsg,
                    weatherEntity: weatherEntity,),
                );
              },
        )
        )    );
  }
}
