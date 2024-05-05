import 'package:flutter/material.dart';
import 'package:task_13/Model/colorModel.dart';
import 'package:task_13/extentions/colorExtention.dart';
import 'package:task_13/presentation/DetailScreen/DetailInfoContainer.dart';

class DetailScreen extends StatelessWidget {
  final CBColor color;

  const DetailScreen({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    final double heightOfColorBox =
        MediaQuery.sizeOf(context).height / 2 - kToolbarHeight;
    final double wigthOfColorBox = MediaQuery.sizeOf(context).width;
    final Color colorOfContainer = HexColor.fromHex(color.value!);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: colorOfContainer,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: heightOfColorBox,
            width: wigthOfColorBox,
            decoration: BoxDecoration(
              color: colorOfContainer,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  color.name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 16,
                ),
                DetailInfoContainet(
                  type: 'Hex',
                  value: color.value!,
                  width: wigthOfColorBox,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DetailInfoContainet(
                      type: 'Red',
                      value: '${colorOfContainer.red}',
                      width: 103,
                    ),
                    DetailInfoContainet(
                      type: 'Green',
                      value: '${colorOfContainer.green}',
                      width: 110,
                    ),
                    DetailInfoContainet(
                      type: 'Blue',
                      value: '${colorOfContainer.blue}',
                      width: 103,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
