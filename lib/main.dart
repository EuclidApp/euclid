import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'home_page.dart';

void main() {
  runApp(EuclidApp());
}

class EuclidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Euclid',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: HomePage(), // Set the home page as the main screen
    );
  }
}

