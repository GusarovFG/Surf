import 'package:flutter/widgets.dart';
import 'package:task_13/Model/colorModel.dart';
import 'package:task_13/presentation/ColorList/colorItem.dart';

class ColorsList extends StatefulWidget {
  final List<CBColor> colors;

  const ColorsList({super.key, required this.colors});

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 46.0),
            child: Wrap(
              spacing: 22,
              alignment: WrapAlignment.center,
              runSpacing: 40,
              children: widget.colors
                  .where((element) => element.value != null)
                  .map((e) => ColorItem(color: e))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
