import 'package:flutter/material.dart';

final ThemeData nbaTheme = ThemeData(
  primaryColor: Colors.black,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline5: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      color: Colors.black87,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);

ContainerStyle customContainerStyle = ContainerStyle(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.teal.withOpacity(0.1),
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10,
        spreadRadius: 5,
      ),
    ],
  ),
);

ContainerStyle secondaryContainerStyle = ContainerStyle(
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10,
        spreadRadius: 5,
      ),
    ],
  ),
);

class ContainerStyle {
  final EdgeInsets padding;
  final BoxDecoration decoration;

  ContainerStyle({
    required this.padding,
    required this.decoration,
  });
}
