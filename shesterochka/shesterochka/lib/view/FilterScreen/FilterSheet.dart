import 'package:flutter/material.dart';
import 'package:shesterochka/AppColors/AppColors.dart';
import 'package:shesterochka/model/ProductsFilter.dart';
import 'package:shesterochka/view/FilterScreen/FilterItem.dart';
import 'package:shesterochka/view/ProductListView/ProductListView.dart';

// ignore: must_be_immutable
class FliterSheet extends StatefulWidget {
  FilterType filter;

  FliterSheet({super.key, required this.filter});

  final _colors = AppColors();

  @override
  State<StatefulWidget> createState() => FliterSheetState();
}

class FliterSheetState extends State<FliterSheet> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Material(
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 64,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 27, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Сортировка',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                          IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.close,
                                size: 24,
                              )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RadioListTile(
                    title: const Text('Без сортировки'),
                    activeColor: widget._colors.buttonsColor,
                    value: FilterType.def,
                    groupValue: widget.filter,
                    onChanged: (value) {
                      setState(() {
                        widget.filter = value!;
                      });
                    },
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'По цене',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12),
                        ),
                      ),
                      RadioListTile(
                        title: const Text('По убыванию'),
                        activeColor: widget._colors.buttonsColor,
                        value: FilterType.ascendingFilter,
                        groupValue: widget.filter,
                        onChanged: (value) {
                          setState(() {
                            widget.filter = value!;
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text('По возрастанию'),
                        activeColor: widget._colors.buttonsColor,
                        value: FilterType.descendingFilter,
                        groupValue: widget.filter,
                        onChanged: (value) {
                          setState(() {
                            widget.filter = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  const Divider(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 48,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            widget._colors.buttonsColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        switch (widget.filter) {
                          case FilterType.def:
                            ProductsFilter().defFilter();
                          case FilterType.ascendingFilter:
                            ProductsFilter().AscendingFilterByPrice();
                          case FilterType.descendingFilter:
                            ProductsFilter().DescendingFilterByPrice();
                        }
                        listKey.currentState?.loaded();
                        listKey.currentState?.setState(() {});
                        Navigator.pop(context);
                      },
                      child: const Text('Готово'),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
