import 'package:flutter/material.dart';
import 'package:task_8/MyColors.dart';

class ColorContainer extends StatelessWidget {
  String _sideOfRadius = '';
  String _text = '';
  String _font = '';
  double _width = 0;
  ImageProvider? _image;

  ColorContainer.right(
      {required double width,
      required String text,
      required String font,
      super.key}) {
    _width = width;
    _sideOfRadius = 'right';
    _font = font;
    _text = text;
  }

  ColorContainer.left(
      {required double width,
      required String text,
      required String font,
      super.key}) {
    _width = width;
    _sideOfRadius = 'left';
    _font = font;
    _text = text;
  }

  ColorContainer.leftWithImage(
      {required double width,
      required String text,
      required String font,
      required AssetImage image,
      super.key}) {
    _width = width;
    _sideOfRadius = 'left';
    _image = image;
    _font = font;
    _text = text;
  }

  @override
  Widget build(BuildContext context) {
    Widget container = Container();
    if (_sideOfRadius == 'left' && _image != null) {
      container = Container(
        width: _width,
        decoration: BoxDecoration(
          color: AppColors().containerColor,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(85),
          ),
        ),
        padding: const EdgeInsetsDirectional.all(10),
        child: Row(children: [
          SizedBox(
            height: 150,
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(75.0),
              child: Image(
                image: _image!,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            _text,
            style:
                TextStyle(fontFamily: _font, color: AppColors().whiteTextColor, fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ]),
      );
    } else if (_sideOfRadius == 'left') {
      container = Container(
        width: _width,
        decoration: BoxDecoration(
          color: AppColors().containerColor,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(85),
          ),
        ),
        padding: const EdgeInsetsDirectional.all(10),
        child: Text(
          _text,
          textAlign: TextAlign.right,
          style:
              TextStyle(fontFamily: _font, color: AppColors().whiteTextColor, fontSize: 15),
        ),
      );
    } else if (_sideOfRadius == 'right') {
      container = Container(
        width: _width,
        decoration: BoxDecoration(
          color: AppColors().containerColor,
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(85),
          ),
        ),
        padding: const EdgeInsetsDirectional.all(10),
        child: Text(
          _text,
          textAlign: TextAlign.left,
          style:
              TextStyle(fontFamily: _font, color: AppColors().whiteTextColor, fontSize: 15),
        ),
      );
    }
    return container;
  }
}
