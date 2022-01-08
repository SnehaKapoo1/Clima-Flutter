import 'package:flutter/material.dart';
import 'package:weather_app/screen/city_screen.dart';
import 'package:weather_app/screen/location_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const LocationScreen(),
    );
  }
}
