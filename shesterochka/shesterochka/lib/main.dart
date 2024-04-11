import 'package:flutter/material.dart';
import 'package:shesterochka/AppColors/AppColors.dart';
import 'package:shesterochka/model/Models.dart';
import 'package:shesterochka/model/Products.dart';
import 'package:shesterochka/view/MainAppBar.dart';
import 'package:shesterochka/view/MainButtomNavigationBar.dart';
import 'package:shesterochka/view/MainHeader.dart';
import 'package:shesterochka/view/ProductListView/ProductListView.dart';
import 'package:shesterochka/view/ProductListView/SummaryWidget.dart';

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
        extendBody: false,
        backgroundColor: AppColors().backgroundColor,
        appBar: MainAppBar(),
        body: Column(
            children: [
              MainHeader(),
              ProductListView(),
            ],
          ),
        
        bottomNavigationBar: MainButtomNavigationBar(),
      ),
    );
  }
}
