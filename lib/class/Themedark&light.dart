import 'package:flutter/material.dart';

final ThemeData darktheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  iconTheme: const IconThemeData(color: Colors.white),
  textTheme: const TextTheme(
  bodyLarge: TextStyle(
    // color: Colors.white,
    fontSize: 18,
    // fontWeight: FontWeight.bold,
  ),
  bodyMedium: TextStyle(
    color: Colors.white,
    fontSize: 16,
  ),
),


);

final ThemeData lighttheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  iconTheme: const IconThemeData(color: Colors.black),
    textTheme: const TextTheme(
  bodyLarge: TextStyle(
    color: Colors.black,
    fontSize: 18,
    // fontWeight: FontWeight.bold,
  ),
  bodyMedium: TextStyle(
    color: Colors.black54,
    fontSize: 16,
  ),
),

);