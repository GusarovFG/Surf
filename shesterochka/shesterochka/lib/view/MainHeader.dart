import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shesterochka/AppColors/AppColors.dart';

class MainHeader extends StatelessWidget {
  final _colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      color: _colors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          const Text(
            'Список покупок', 
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          GestureDetector(
            child: Container(
              width: 32,
              height: 32,
              child: SvgPicture.asset('assets/sortButton.svg'),
            ),
          )
        ]),
      ),
    );
  }
}
