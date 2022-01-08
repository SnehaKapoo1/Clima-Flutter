import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/utilities/constants.dart';

import 'city_screen.dart';

const color = Colors.black87;

class LocationScreen extends StatefulWidget {
  final locationweather;

  const LocationScreen({Key? key, this.locationweather}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherIconCondition = WeatherModel();

  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationweather);
  }

  /*void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Warning'),
        content: Text(
            'Please check your Internet connectivity or refresh the page by refresh icon!'),
      ),
    );
  }*/

  void updateUi(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }

      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherIconCondition.getWeatherIcon(condition);
      weatherMessage = weatherIconCondition.getMessage(temperature);
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/raining.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData =
                          await weatherIconCondition.getLocationData();
                      updateUi(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      color: color,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CityScreen(),
                        ),
                      );
                      if (typedName != null) {
                        var weatherData = await weatherIconCondition
                            .getCityWeather(typedName);
                        updateUi(weatherData);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      color: color,
                      size: 50.0,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
              const SizedBox(
                height: 0.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
print(temperature);*/
