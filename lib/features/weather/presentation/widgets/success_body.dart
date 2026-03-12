import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/widgets/info_card.dart';

class SuccessBody extends StatelessWidget {
  const SuccessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Cairo",
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text("TODAY, 14 OCT", style: TextStyle(color: Colors.white54)),

        Image.asset('', height: 180),

        Text("28°", style: TextStyle(fontSize: 80, color: Colors.white)),
        Text(
          "Partly Cloudy",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Text("H:31°  L:22°", style: TextStyle(color: Colors.white54)),

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
                value: "30°C",
                // desc: "Similar to actual temp.",
              ),
              InfoCard(
                icon: "assets/Droplets.svg",
                title: "HUMIDITY",
                value: "45%",
                // desc: "The dew point is 15°",
              ),
              InfoCard(
                icon: "assets/Wind.svg",
                title: "WIND",
                value: "12 km/h",
                // desc: "Light breeze from NE.",
              ),
              InfoCard(
                icon: "assets/SunDim.svg",
                title: "Visibility",
                value: "6",
                // desc: "High. Use protection.",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
