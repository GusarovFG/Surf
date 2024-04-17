import 'package:shesterochka/model/Products.dart';
import 'package:shesterochka/model/models.dart';
import 'package:shesterochka/view/FilterScreen/FilterItem.dart';

class ProductsFilter {
  static ProductsFilter? _instance;

  List<ProductEntity> products = Products().dataForStudents;
  List<ProductEntity> filteredProducts = Products().dataForStudents;
  FilterType filter = FilterType.def;

  ProductsFilter._privateConstructor();

  factory ProductsFilter() =>
      _instance ??= ProductsFilter._privateConstructor();

  Future<void> AscendingFilterByPrice() async {
    filteredProducts.sort((a, b) => b.salePrice.compareTo(a.salePrice));
    filter = FilterType.ascendingFilter;
  }

  Future<void> DescendingFilterByPrice() async {
    filteredProducts.sort((a, b) => a.salePrice.compareTo(b.salePrice));
    filter = FilterType.descendingFilter;
  }

  Future<void> defFilter() async {
    filteredProducts.clear();
    filteredProducts.addAll(products);
    filter = FilterType.def;
  }
}
