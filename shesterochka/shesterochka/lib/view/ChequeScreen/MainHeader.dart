import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shesterochka/AppColors/AppColors.dart';
import 'package:shesterochka/model/ProductsFilter.dart';
import 'package:shesterochka/view/FilterScreen/FilterItem.dart';
import 'package:shesterochka/view/FilterScreen/FilterSheet.dart';

class MainHeader extends StatefulWidget {
  final BuildContext mainContext;


  MainHeader({super.key, required this.mainContext});

  @override
  State<MainHeader> createState() => _MainHeaderState();
}

class _MainHeaderState extends State<MainHeader> {
  final _colors = AppColors();

  var filter = FilterType.def;

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
              onTap: () {
                showModalBottomSheet(
                  clipBehavior: Clip.antiAlias,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    filter = ProductsFilter().filter;
                    return FliterSheet(filter: filter);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
