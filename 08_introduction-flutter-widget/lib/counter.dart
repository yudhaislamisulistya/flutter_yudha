import 'package:flutter/material.dart';
import 'package:hello_world/constant.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _number = 0;

  void _increment() {
    setState(() {
      _number++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter', style: TextStyle(color: Colors.white)),
          backgroundColor: primaryLight,
        ),
        body: Center(
          child: Text('Counter: $_number'),
        ),
        backgroundColor: primaryContainerLight,
        floatingActionButton: FloatingActionButton(
          onPressed: _increment,
          backgroundColor: primaryLight,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 50,
          ),
        ));
  }
}
