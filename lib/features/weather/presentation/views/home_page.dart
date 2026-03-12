import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weather_app/core/service/getit.dart';
import 'package:weather_app/features/weather/domain/repo.dart';
import 'package:weather_app/features/weather/presentation/cubit/get_weather_cubit.dart';
import 'package:weather_app/features/weather/presentation/views/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(getIt<Repo>()),
      child: Scaffold(
        body: 
        // HomePageBody(success: true)
        BlocBuilder<GetWeatherCubit, GetWeatherState>(
          builder: (context, state) {
            if (state is CurrentWeatherFailure) return HomePageBody(success: false);

            return ModalProgressHUD(
            inAsyncCall: state is CurrentWeatherLoading, 
            child: HomePageBody(success: true,));
            
          },
        )
        )    );
  }
}
