import 'package:flutter/material.dart';
import 'package:shesterochka/AppColors/AppColors.dart';
import 'package:shesterochka/view/ChequeScreen/MainAppBar.dart';
import 'package:shesterochka/view/ChequeScreen/MainButtomNavigationBar.dart';
import 'package:shesterochka/view/ChequeScreen/MainHeader.dart';
import 'package:shesterochka/view/ProductListView/ProductListView.dart';

class ChequeScreen extends StatelessWidget {
  ChequeScreen({super.key});

  final _colors = AppColors();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Sora'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: false,
        backgroundColor: _colors.backgroundColor,
        appBar: MainAppBar(),
        body: Column(
          children: [
            
            MainHeader(
              mainContext: context,
            ),
            ProductListView(key: listKey),
          ],
        ),
        bottomNavigationBar: MainButtomNavigationBar(),
      ),
    );
  }


}
