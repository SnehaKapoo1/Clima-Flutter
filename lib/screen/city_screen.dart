import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';

import 'location_screen.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white,
                    size: 35.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.white60,
                    ),
                    elevation: 12,
                    shadowColor: Colors.white70),
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
