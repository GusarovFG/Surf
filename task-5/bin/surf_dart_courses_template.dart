void main() {
  final DateTime currentDate = DateTime(2022, 12, 20);

  final List<RawProductItem> ListOfProduct = [
    RawProductItem(
      name: 'Персик',
      categoryName: 'Растительная пища',
      subcategoryName: 'Фрукты',
      expirationDate: DateTime(2022, 12, 22),
      qty: 5,
    ),
    RawProductItem(
      name: 'Молоко',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Напитки',
      expirationDate: DateTime(2022, 12, 22),
      qty: 5,
    ),
    RawProductItem(
      name: 'Кефир',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Напитки',
      expirationDate: DateTime(2022, 12, 22),
      qty: 5,
    ),
    RawProductItem(
      name: 'Творог',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Не напитки',
      expirationDate: DateTime(2022, 12, 22),
      qty: 0,
    ),
    RawProductItem(
      name: 'Творожок',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Не напитки',
      expirationDate: DateTime(2022, 12, 22),
      qty: 0,
    ),
    RawProductItem(
      name: 'Творог',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Не напитки',
      expirationDate: DateTime(2022, 12, 22),
      qty: 0,
    ),
    RawProductItem(
      name: 'Гауда',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Сыры',
      expirationDate: DateTime(2022, 12, 22),
      qty: 3,
    ),
    RawProductItem(
      name: 'Маасдам',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Сыры',
      expirationDate: DateTime(2022, 12, 22),
      qty: 2,
    ),
    RawProductItem(
      name: 'Яблоко',
      categoryName: 'Растительная пища',
      subcategoryName: 'Фрукты',
      expirationDate: DateTime(2022, 12, 4),
      qty: 4,
    ),
    RawProductItem(
      name: 'Морковь',
      categoryName: 'Растительная пища',
      subcategoryName: 'Овощи',
      expirationDate: DateTime(2022, 12, 23),
      qty: 51,
    ),
    RawProductItem(
      name: 'Черника',
      categoryName: 'Растительная пища',
      subcategoryName: 'Ягоды',
      expirationDate: DateTime(2022, 12, 25),
      qty: 0,
    ),
    RawProductItem(
      name: 'Курица',
      categoryName: 'Мясо',
      subcategoryName: 'Птица',
      expirationDate: DateTime(2022, 12, 18),
      qty: 2,
    ),
    RawProductItem(
      name: 'Говядина',
      categoryName: 'Мясо',
      subcategoryName: 'Не птица',
      expirationDate: DateTime(2022, 12, 17),
      qty: 0,
    ),
    RawProductItem(
      name: 'Телятина',
      categoryName: 'Мясо',
      subcategoryName: 'Не птица',
      expirationDate: DateTime(2022, 12, 17),
      qty: 0,
    ),
    RawProductItem(
      name: 'Индюшатина',
      categoryName: 'Мясо',
      subcategoryName: 'Птица',
      expirationDate: DateTime(2022, 12, 17),
      qty: 0,
    ),
    RawProductItem(
      name: 'Утка',
      categoryName: 'Мясо',
      subcategoryName: 'Птица',
      expirationDate: DateTime(2022, 12, 18),
      qty: 0,
    ),
    RawProductItem(
      name: 'Гречка',
      categoryName: 'Растительная пища',
      subcategoryName: 'Крупы',
      expirationDate: DateTime(2022, 12, 22),
      qty: 8,
    ),
    RawProductItem(
      name: 'Свинина',
      categoryName: 'Мясо',
      subcategoryName: 'Не птица',
      expirationDate: DateTime(2022, 12, 23),
      qty: 5,
    ),
    RawProductItem(
      name: 'Груша',
      categoryName: 'Растительная пища',
      subcategoryName: 'Фрукты',
      expirationDate: DateTime(2022, 12, 25),
      qty: 5,
    )
  ];

  final filter = FilterByExpired();

  List<RawProductItem> getFiltredListOfProducts(
      List<RawProductItem> products, Filter filter, DateTime date) {
    final filteredRawProducts =
        filter.apply(rawProducts: products, currentDate: date);

    return filteredRawProducts.toList();
  }

  final filteredProducts =
      getFiltredListOfProducts(ListOfProduct, filter, currentDate);

  Map<String, Map<String, List<String>>> getCategoriesOfFilteredProducts(
      List<RawProductItem> products) {
    Map<String, List<String>> subCategory = {
      for (var product in products)
        product.subcategoryName: products
            .where((e) => e.subcategoryName == product.subcategoryName)
            .map((e) => e.name)
            .toList()
    };

    Map<String, Map<String, List<String>>> categories = {};
    var category = filteredProducts.map((e) => e.categoryName).toList().toSet();
    for (var catt in category) {
      Map<String, List<String>> mapOfSubCategories = {};
      List<String> listOfNames = [];
      for (var sub in filteredProducts
          .where((element) => element.categoryName == catt)
          .map((e) => e.subcategoryName)) {
        List<String> listOfSubCatNames = filteredProducts
            .where((element) => element.subcategoryName == sub)
            .map((e) => e.name)
            .toList();
        listOfNames = listOfSubCatNames;
        mapOfSubCategories.addAll({sub: listOfNames});
        categories.addAll({catt: mapOfSubCategories});
      }
    }

    return categories;
  }

  print(getCategoriesOfFilteredProducts(filteredProducts));
}

class RawProductItem {
  String name;
  String categoryName;
  String subcategoryName;
  DateTime expirationDate;
  int qty;

  RawProductItem(
      {required this.name,
      required this.categoryName,
      required this.subcategoryName,
      required this.expirationDate,
      required this.qty});

  @override
  String toString() {
    return '$name, $categoryName, $subcategoryName, $expirationDate, $qty';
  }
}

abstract class Filter {
  List<RawProductItem> apply(
      {required List<RawProductItem> rawProducts,
      required DateTime currentDate});
}

class FilterByExpired implements Filter {
  @override
  List<RawProductItem> apply(
      {required List<RawProductItem> rawProducts,
      required DateTime currentDate}) {
    return rawProducts
        .where((element) => element.qty != 0)
        .toList()
        .where((element) => !element.expirationDate.isBefore(currentDate))
        .toList();
  }
}
