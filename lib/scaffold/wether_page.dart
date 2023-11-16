import 'package:flutter/material.dart';
import 'package:myapp/models/wether_models.dart';
import 'package:myapp/weatherservices/services.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _wetherservice = Weatherservice("ddfbf79f7fa0c1d1da798e04167739bb");
  Weather? _weather;
  _fetchweather() async {
    List<double> position = await _wetherservice.getcity();
    print(position);
    try {
      final weather = await _wetherservice.getWeather(position[0], position[1]);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getweatheranimation(String? maincondition) {
    if (maincondition == null) {
      return 'lib/assets/sunny.gif';
    }
    switch (maincondition.toLowerCase()) {
      case "clear":
        {
          return "lib/assets/sunny.gif";
        }
      case "clouds":
        {
          return "lib/assets/3.gif";
        }
      case "rain":
        {
          return "lib/assets/cloud.gif";
        }
      default:
        {
          return "lib/assets/night-clear.gif";
        }
    }
  }

  @override
  void initState() {
    super.initState();

    _fetchweather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _weather?.cityname ?? "loding city ...",
              style: const TextStyle(fontSize: 28),
            ),
            Image.asset(getweatheranimation(_weather?.maincondition)),
            Text(
              _weather?.maincondition ?? "loding ...",
              style: const TextStyle(fontSize: 23),
            ),
            Text(
              " ${_weather?.temprature.round()} ℃ ",
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
