import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });
  factory WeatherModel.fromjson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];
    // factory named constractor is better
    // date = data["location"]["localtime"];
    // temp = jsonData["avgtemp_c"];
    // maxTemp = jsonData["maxtemp_c"];
    // minTemp = jsonData["mintemp_c"];
    // weatherStateName = jsonData["condition"]["text"];
    return WeatherModel(
      date: DateTime.parse(data["current"]["last_updated"]),
      temp: jsonData["avgtemp_c"],
      maxTemp: jsonData["maxtemp_c"],
      minTemp: jsonData["mintemp_c"],
      weatherStateName: data["current"]["condition"]["text"],
    );
  }
// there was  a problem in API
  String getImage() {
    if (temp > 12) {
      return 'assets/images/clear.png';
    } else if (temp > 9 && temp <= 12) {
      return 'assets/images/snow.png';
    } else if (temp > 6 && temp <= 9) {
      return 'assets/images/cloudy.png';
    } else if (temp > 3 && temp <= 6) {
      return 'assets/images/rainy.png';
    } else if (temp >= 0 && temp <= 3) {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  //theme of tha app
  MaterialColor getColor() {
    if (temp > 12) {
      return Colors.orange;
    } else if (temp > 9 && temp <= 12) {
      return Colors.blue;
    } else if (temp > 6 && temp <= 9) {
      return Colors.blueGrey;
    } else if (temp > 3 && temp <= 6) {
      return Colors.grey;
    } else if (temp >= 0 && temp <= 3) {
      return Colors.indigo;
    } else {
      return Colors.amber;
    }
  }
}
