import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_13/Model/colorModel.dart';
import 'package:task_13/extentions/colorExtention.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_13/presentation/DetailScreen/DetailScreen.dart';

class ColorItem extends StatelessWidget {
  final CBColor color;

  const ColorItem({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        await Clipboard.setData(ClipboardData(text: color.value!));
        Fluttertoast.showToast(
            msg: "Hex скопирован",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: const Color.fromRGBO(9, 15, 47, 0.8),
            textColor: Colors.white,
            fontSize: 16.0);
      },
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailScreen(color: color),
        ),
      ),
      child: SizedBox(
        height: 140,
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: HexColor.fromHex(color.value!),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '${color.name}\n${color.value}}',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
    );
  }
}
