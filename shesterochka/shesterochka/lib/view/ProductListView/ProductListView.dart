import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shesterochka/AppColors/AppColors.dart';
import 'package:shesterochka/model/FilterOfProduct/ProductsFilter.dart';
import 'package:shesterochka/view/ProductListView/ProductItem.dart';
import 'package:shesterochka/view/ProductListView/SummaryWidget.dart';

final GlobalKey<ProductListViewState> listKey = GlobalKey();

class ProductListView extends StatefulWidget {
  ProductListView({super.key});

  @override
  State<StatefulWidget> createState() => ProductListViewState();
}

class ProductListViewState extends State<ProductListView> {
  final _prorducts = ProductsFilter().filteredProducts;
  var _isLoad = false;

  @override
  void initState() {
    loaded();
    super.initState();
  }

  void loaded() {
    _isLoad = false;
    Timer(const Duration(seconds: 2), loading);
  }

  void loading() {
    setState(() {
      _isLoad = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoad
        ? Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
              itemBuilder: (BuildContext context, int index) {
                final product = _prorducts[index];

                final previousProduct =
                    index > 0 ? _prorducts[index - 1] : _prorducts[index];
                final productItem = ProductItem(product: product);

                if (product.category != previousProduct.category ||
                    product == _prorducts.first) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.category.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      productItem
                    ],
                  );
                } else if (product == _prorducts.last) {
                  return Column(
                    children: [
                      productItem,
                      Divider(
                        color: AppColors().secondTextColor,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SummaryWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                } else {
                  return productItem;
                }
              },
              itemCount: _prorducts.length,
            ),
          )
        : Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Здесь пока ничего нет',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 50,
                ),
                CircularProgressIndicator(
                  color: AppColors().buttonsColor,
                ),
              ],
            ),
          );
  }
}
