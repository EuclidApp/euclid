import 'package:flutter/material.dart';
import 'package:euclid_app/mainMap.dart';

void main() {
  runApp(const EuclidApp());
}

class EuclidApp extends StatelessWidget {
  const EuclidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Euclid App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MapScreen(),
    );
  }
}
