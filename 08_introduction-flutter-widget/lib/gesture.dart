import 'package:flutter/material.dart';

import 'constant.dart';

class Gesture extends StatefulWidget {
  const Gesture({super.key});

  @override
  State<Gesture> createState() => _GestureState();
}

class _GestureState extends State<Gesture> {
  bool _isAActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture'),
        backgroundColor: primaryLight,
      ),
      backgroundColor: primaryContainerLight,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('This is gesture detector page'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _isAActive = !_isAActive;
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      color: _isAActive ? primaryDark : primaryLight,
                      child: _isAActive
                          ? const Center(
                              child: Text('Active',
                                  style: TextStyle(color: primaryLight)))
                          : const Center(
                              child: Text('Inactive',
                                  style: TextStyle(color: primaryDark))),
                    )),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _isAActive = !_isAActive;
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      color: _isAActive ? primaryLight : primaryDark,
                      child: _isAActive
                          ? const Center(
                              child: Text('Inactive',
                                  style: TextStyle(color: primaryDark)))
                          : const Center(
                              child: Text('Active',
                                  style: TextStyle(color: primaryLight))),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
