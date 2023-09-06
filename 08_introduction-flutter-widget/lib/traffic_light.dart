import 'package:flutter/material.dart';

import 'constant.dart';

class TrafficLight extends StatefulWidget {
  const TrafficLight({super.key});

  @override
  State<TrafficLight> createState() => _TrafficLightState();
}

class _TrafficLightState extends State<TrafficLight> {
  Color _light = Colors.red;

  void _changeLight(Color light) {
    setState(() {
      _light = light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Traffic Light'), backgroundColor: primaryLight),
        backgroundColor: primaryContainerLight,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _Light(light: _light),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Button(
                  color: Colors.red,
                  text: const Text('Red'),
                  onTap: _changeLight),
              _Button(
                  color: Colors.yellow.shade700,
                  text: const Text('Yellow'),
                  onTap: _changeLight),
              _Button(
                  color: Colors.green,
                  text: const Text('Green'),
                  onTap: _changeLight),
            ],
          )
        ])));
  }
}

class _Light extends StatelessWidget {
  const _Light({this.light = Colors.red});

  final Color light;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: Colors.black26,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(color: light, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({required this.color, required this.text, required this.onTap});

  final Color color;
  final Text text;
  final ValueChanged<Color> onTap;

  void _changeColor() {
    onTap(color);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: _changeColor,
        child: text);
  }
}
