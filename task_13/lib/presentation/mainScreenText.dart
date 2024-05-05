import 'package:flutter/material.dart';

class MainScreenText extends StatelessWidget {
  const MainScreenText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Text(
          'Эксклюзивная палитра «Colored Box»',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.black),
          maxLines: 2,
        ),
    );
  }

}

