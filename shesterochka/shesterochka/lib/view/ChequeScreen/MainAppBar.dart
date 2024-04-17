import 'package:flutter/material.dart';
import 'package:shesterochka/AppColors/AppColors.dart';
import 'package:shesterochka/view/ChequeScreen/MainHeader.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final _appColors = AppColors();

  MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: _appColors.backgroundColor,
      elevation: 0,
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Чек № 56",
          style: TextStyle(fontSize: 18, color: _appColors.textColor, fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
              text: '\n24.02.23 в 12:23',
              style: TextStyle(fontSize: 10, color: _appColors.secondTextColor),
            ),
          ],
        ),
      ),
      leading: BackButton(color: _appColors.buttonsColor),
      
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
