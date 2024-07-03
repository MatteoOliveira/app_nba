import 'package:flutter/material.dart';

class CustomStyles {
  static final primaryContainer = ContainerStyle(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.blueGrey[50],
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static final secondaryContainer = ContainerStyle(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
  );
}

class ContainerStyle {
  final EdgeInsetsGeometry padding;
  final BoxDecoration decoration;

  const ContainerStyle({
    required this.padding,
    required this.decoration,
  });
}

// Define your theme data here if needed
final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.blue,
  // Add other theme properties here if needed
);
