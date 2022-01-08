import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screen/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationData();

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LocationScreen(
                locationweather: weatherData,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.white, size: 100.0),
      ),
    );
  }
}
