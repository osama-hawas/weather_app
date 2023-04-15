import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchPage extends StatelessWidget {
  SearchPage({this.updateUi});
  String? cityName;
  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              WeatherModel? weatherModel =
                  await service.getweather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weatherModel;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    WeatherService service = WeatherService();
                    WeatherModel? weatherModel =
                        await service.getweather(cityName: cityName!);
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weatherModel;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;

                    Navigator.pop(context);
                  }),
              label: Text('search '),
              hintText: 'Enter a city name',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            ),
          ),
        ),
      ),
    );
  }
}
