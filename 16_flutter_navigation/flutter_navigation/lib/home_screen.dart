import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to About Page"),
          onPressed: () {
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(
            //     builder: (context) => AboutScreen(
            //       parameter: "Alterra Academy New",
            //     ),
            //   ),
            // );
            Navigator.of(context).pushNamed(
              "/about",
              arguments: "Alterra Academy New With Named Route",
            );
          },
        ),
      ),
    );
  }
}
