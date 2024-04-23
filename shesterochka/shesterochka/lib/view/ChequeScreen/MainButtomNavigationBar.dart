import 'package:flutter/material.dart';
import 'package:shesterochka/AppColors/AppColors.dart';

// ignore: must_be_immutable
class MainButtomNavigationBar extends StatefulWidget {
  MainButtomNavigationBar({super.key});

  final _colors = AppColors();
  var _startIndex = 3;

  @override
  State<StatefulWidget> createState() => MainButtomNavigationBarState();
}

class MainButtomNavigationBarState extends State<MainButtomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget._startIndex,
      selectedItemColor: widget._colors.buttonsColor,
      unselectedItemColor: widget._colors.secondTextColor,
      backgroundColor: widget._colors.backgroundColor,
      showUnselectedLabels: true,
      selectedLabelStyle:
          TextStyle(color: widget._colors.buttonsColor, fontSize: 10),
      unselectedLabelStyle:
          TextStyle(color: widget._colors.textColor, fontSize: 10),
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/catalogIcon.png'),
            ),
            label: 'Каталог'),
        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/search.png'),
            ),
            label: 'Поиск'),
        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/local_mall.png'),
            ),
            label: 'Карзина'),
        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/person_outline.png'),
            ),
            label: 'Личное'),
      ],
      onTap: (value) {
        setState(() {
          widget._startIndex = value;
        });
      },
    );
  }
}
