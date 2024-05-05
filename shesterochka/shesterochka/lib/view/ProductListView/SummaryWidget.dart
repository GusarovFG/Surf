import 'package:flutter/material.dart';
import 'package:shesterochka/AppColors/AppColors.dart';
import 'package:shesterochka/model/Products.dart';

class SummaryWidget extends StatelessWidget {
  final products = Products().dataForStudents;

  SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 118,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'В вашей покупке',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors().textColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${products.length} товаров',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors().textColor),
              ),
              Text(
                '${products.fold(0.0, (previousValue, element) => previousValue + element.decimalPrice.toDouble()).toStringAsFixed(2)} руб',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors().textColor),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Скидка ${products.fold(
                      0.0,
                      (previousValue, element) =>
                          previousValue +
                          element.sale.toDouble()  *
                              100 /
                              products.fold(
                                  0.0,
                                  (previousValue, element) =>
                                      previousValue +
                                      element.decimalPrice.toDouble()),
                    ).toStringAsFixed(1)}%',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors().textColor),
              ),
              Text(
                '-${products.fold(
                      0.0,
                      (previousValue, element) =>
                          previousValue +
                          element.sale.toDouble() / 100).toStringAsFixed(2)} руб',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors().textColor),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Итого',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors().textColor),
              ),
              Text(
                '${products.fold(0.0, (previousValue, element) => previousValue + element.salePrice.toDouble()).toStringAsFixed(2)} руб',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors().textColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
