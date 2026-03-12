import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/providers/weather_provider.dart';
import 'package:weather_app/core/service/getit.dart';
import 'package:weather_app/features/weather/presentation/views/home_page.dart';

void main() {
  getItSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) { 
        return WeatherProvider();
       },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}

