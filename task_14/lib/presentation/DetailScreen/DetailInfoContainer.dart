import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';


class DetailInfoContainet extends StatelessWidget {
  final String type;
  final String value;
  final double width;

  const DetailInfoContainet(
      {super.key, required this.type, required this.value, required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: value));
        Fluttertoast.showToast(
            msg: "$type скопирован",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: const Color.fromRGBO(9, 15, 47, 0.8),
            textColor: Colors.white,
            fontSize: 16.0);
      },
      child: Container(
        width: width,
        height: 56,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(55, 57, 74, 0.08),
                  blurRadius: 12,
                  offset: Offset(0, 12)),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              type,
              style: const TextStyle(
                  color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Text(
              value,
              style: const TextStyle(
                  color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
            )
          ]),
        ),
      ),
    );
  }
}
