import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  double _leftValue = 0;
  double _topValue = 0;
  Color _color = Colors.black;
  final Random _random = Random();
  double _turns = 0;

  bool _isRectangle = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: GestureDetector(
            onTap: () => setState(() {
              _color = Color.fromARGB(
                  _random.nextInt(255),
                  _random.nextInt(255),
                  _random.nextInt(255),
                  _random.nextInt(255));
              _isRectangle = !_isRectangle;
            }),
            onPanUpdate: (details) => setState(() {
              _topValue += details.delta.dy;
              _leftValue += details.delta.dx;
            }),
            onLongPress: () => setState(() {
              _turns += 1 / 2;
            }),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(10),
                  border: Border.all(color: Colors.black),
                  shape: BoxShape.rectangle),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    left: _leftValue,
                    top: _topValue,
                    child: AnimatedRotation(
                      turns: _turns,
                      duration: const Duration(seconds: 2),
                      child: Icon(
                        Icons.face,
                        color: _color,
                        size: 200,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
