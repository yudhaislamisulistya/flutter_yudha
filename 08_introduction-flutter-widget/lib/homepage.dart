import 'package:flutter/material.dart';
import 'package:hello_world/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), backgroundColor: primaryLight),
      body: const Center(
        child: Text('This is home page.'),
      ),
      backgroundColor: primaryContainerLight,
    );
  }
}
