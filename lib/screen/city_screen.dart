import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/simple_city_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Color(0xff142ca4),
                  size: 35.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: null,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Get Weather',
                style: kButtonTextStyle,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
