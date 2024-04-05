import 'package:flutter/material.dart';
import 'package:shesterochka/AppColors/AppColors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _appColors = AppColors();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Sora'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: _appColors.backgroundColor,
          elevation: 0,
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Чек № 56",
              style: TextStyle(fontSize: 18, color: _appColors.textColor),
              children: <TextSpan>[
                TextSpan(
                  text: '\n24.02.23 в 12:23',
                  style: TextStyle(
                      fontSize: 10, color: _appColors.secondTextColor),
                ),
              ],
            ),
          ),
          leading: BackButton(color: _appColors.buttonsColor),
        ),
      ),
    );
  }
}
