import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'd6809a82e4674d0b998134853230702';

  Future<WeatherModel?> getweather({required String cityName}) async {
    WeatherModel? weatherModel;
    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&day=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weatherModel = WeatherModel.fromjson(data);
    } catch (e) {
      print(e);
    }

    return weatherModel;
  }
}
