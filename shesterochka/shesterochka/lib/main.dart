import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: "Чек № 56",
              style: TextStyle(fontSize: 18, fontFamily: 'Sora'),
              children: <TextSpan>[
                TextSpan(
                  text: '\n24.02.23 в 12:23',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
