import 'package:flutter/material.dart';
import 'package:hello_world/traffic_light.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TrafficLight(),
      debugShowCheckedModeBanner: false,
    );
  }
}
