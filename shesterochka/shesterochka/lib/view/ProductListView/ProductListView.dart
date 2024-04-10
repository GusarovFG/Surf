import 'package:flutter/material.dart';
import 'package:shesterochka/AppColors/AppColors.dart';
import 'package:shesterochka/model/Products.dart';
import 'package:shesterochka/view/ProductListView/ProductItem.dart';

class ProductListView extends StatefulWidget {
  ProductListView({super.key});

  @override
  State<StatefulWidget> createState() => ProductListViewState();
}

class ProductListViewState extends State<ProductListView> {
  final _prorducts = Products().dataForStudents;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
        itemBuilder: (BuildContext context, int index) {
          final product = _prorducts[index];
          final productItem = ProductItem(product: product);
    
          if (product != _prorducts.last &&
              _prorducts[index + 1].category == product.category) {
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
          } else if ((product != _prorducts.last &&
                  _prorducts[index + 1].category != product.category) ||
              product == _prorducts.last) {
            return Column(
              children: [
                productItem,
                Divider(
                  color: AppColors().secondTextColor,
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            );
          } else {
            return productItem;
          }
        },
        itemCount: _prorducts.length,
      ),
    );
  }
}
