import 'package:flutter/material.dart';

const kTempTextStyle =
    TextStyle(fontFamily: 'Spartan MB', fontSize: 60.0, color: Colors.black87);

const kMessageTextStyle =
    TextStyle(fontFamily: 'Spartan MB', fontSize: 40.0, color: Colors.black87);

const kButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontFamily: 'Spartan MB',
  color: Colors.white,
);

const kConditionTextStyle = TextStyle(fontSize: 100.0, color: Colors.black87);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white54,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Search City Weather',
  hintStyle: TextStyle(color: Colors.white),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
