import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_13/Model/colorModel.dart';
import 'package:task_13/Presentors/MainScreenContract.dart';
import 'package:task_13/Presentors/MainScreenPresenter.dart';
import 'package:task_13/presentation/ColorList/colorsList.dart';
import 'package:task_13/presentation/mainScreenText.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> implements MainScreenContract {
  late MainScreenPresenter _presenter;

  CbColors _colors = CbColors(colors: []);

  late bool _isLoading;

  _MainScreenState() {
    _presenter = MainScreenPresenter(this);
  }

  @override
  void fetchFutureColors(CbColors colors) {
    setState(() {
      _colors = colors;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _presenter.loadColors();
    _isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.black,
              statusBarBrightness: Brightness.light),
        ),
        body: Column(
          children: [
            const MainScreenText(),
            !_isLoading
                ? ColorsList(colors: _colors.colors)
                : const Center(
                    child: Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: CircularProgressIndicator())),
          ],
        ),
      ),
    );
  }
}
