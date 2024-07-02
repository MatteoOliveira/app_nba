import 'package:flutter/material.dart';
import 'content.dart';
import './models/team.dart'; // Ensure this import is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NBA App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContentScreen(),
    );
  }
}
