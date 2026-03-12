import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/domain/entity/weather_entity.dart';
import 'package:weather_app/features/weather/presentation/widgets/info_card.dart';

class SuccessBody extends StatelessWidget {
  const SuccessBody({super.key, required this.weatherEntity});
  final WeatherEntity weatherEntity;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    return Column(
      children: [
        Text(
          weatherEntity.cityName,
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text("TODAY, ${dateTime.day}/${dateTime.month}", style: TextStyle(color: Colors.white54)),

        // Image.asset('', height: 180),

        Text("${weatherEntity.temp.toInt()}°", style: TextStyle(fontSize: 80, color: Colors.white)),
        Text(
          weatherEntity.description,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Text("H:${weatherEntity.tempMax.toInt()}°  L:${weatherEntity.tempMin.toInt()}°", style: TextStyle(color: Colors.white54)),

        SizedBox(height: 40),

        Expanded(
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.2,
            children: [
              InfoCard(
                icon: "assets/Thermometer.svg",
                title: "FEELS LIKE",
                value: "${weatherEntity.feelsLike}°C",
                // desc: "Similar to actual temp.",
              ),
              InfoCard(
                icon: "assets/Droplets.svg",
                title: "HUMIDITY",
                value: "${weatherEntity.humidity}%",
                // desc: "The dew point is 15°",
              ),
              InfoCard(
                icon: "assets/Wind.svg",
                title: "WIND",
                value: "${weatherEntity.windSpeed}km/h",
                // desc: "Light breeze from NE.",
              ),
              InfoCard(
                icon: "assets/SunDim.svg",
                title: "Visibility",
                value: "${weatherEntity.visibility}",
                // desc: "High. Use protection.",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
