import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import '../../models/wether_models.dart';
import 'package:http/http.dart' as http;

class Weatherservice {
  static const BASE_URL = "https://api.openweathermap.org/data/2.5/weather";
  final String apikey;
  Weatherservice(this.apikey);

  Future<Weather> getWeather(double lat,double lon) async {
    final response =await http.get(Uri.parse('$BASE_URL?lat=$lat&lon=$lon&appid=$apikey'));
    final wether=Weather.fromJson(jsonDecode(response.body));
    return wether;
  }

  Future<List<double>> getcity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    double lat = double.parse((position.latitude).toStringAsFixed(2));
    double lon = double.parse((position.longitude).toStringAsFixed(2));
    return [lat,lon];
  }
}
