import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // api key
  final _weatherService = WeatherService('b0582d271437bbc6d79d6fc564f4fa0a');
  Weather? _weather;

  //fetch weather
  _ftchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    //get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  // init state

  @override
  void initState() {
    super.initState();
    _ftchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //cityName
            Text(_weather?.cityName ?? "Loading city.."),
        
            // temperature
            Text('${_weather?.temperature.round()}°C')
          ],
        ),
      ),

    );
  }
}
