import 'package:flutter/material.dart';
import 'package:flutter_navigation/about_screen.dart';
import 'package:flutter_navigation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alta - 16. Flutter Navigatiopn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/about": (context) => AboutScreen(),
      },
      home: const HomeScreen(),
    );
  }
}
