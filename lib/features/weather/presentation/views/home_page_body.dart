import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/weather/presentation/cubit/get_weather_cubit.dart';
import 'package:weather_app/features/weather/presentation/widgets/failure_body.dart';
import 'package:weather_app/features/weather/presentation/widgets/success_body.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key, required this.success});
  final bool success;

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}


class _HomePageBodyState extends State<HomePageBody> {

  @override
  void initState() {
    context.read<GetWeatherCubit>().getCurrentWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String city = '';
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
                      // width: 0.1,
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    onSubmitted: (value) {
                      setState(() {
                        city = value;
                      });
                        
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.search, color: Colors.white54),
                      hintText: city,
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                ),
            
                SizedBox(height: 30),
                Expanded(
                  child: widget.success? SuccessBody(): FailureBody(),
                )
              ],
            ),
          ),
        ),
      );
  }
}