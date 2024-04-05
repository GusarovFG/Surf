import 'package:flutter/material.dart';
import 'package:shesterochka/view/MainAppBar.dart';
import 'package:shesterochka/view/MainButtomNavigationBar.dart';
import 'package:shesterochka/view/MainHeader.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Sora'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MainAppBar(),
        body: MainHeader(),
        bottomNavigationBar: MainButtomNavigationBar(),
      ),
    );
  }
}
