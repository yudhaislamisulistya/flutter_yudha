import 'package:flutter/material.dart';
import 'package:flutter_navigation/home_screen.dart';

// ignore: must_be_immutable
class AboutScreen extends StatelessWidget {
  String? parameter;
  AboutScreen({super.key, this.parameter});

  @override
  Widget build(BuildContext context) {
    final parameter = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Screen"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(parameter),
            // ElevatedButton(
            //   child: const Text("Go to About Page"),
            //   onPressed: () {
            //     Navigator.of(context).pushReplacement(
            //       MaterialPageRoute(
            //         builder: (context) => const HomeScreen(),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
