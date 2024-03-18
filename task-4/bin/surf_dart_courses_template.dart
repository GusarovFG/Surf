void main() {
  final articles = '''
1,хлеб,Бородинский,500,5
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5
''';

  final products =
      articles.split('\n').map((e) => e.split(',')).toList();
      products.removeLast();
  final List<Product> listOfProducts = [];

  while (products.isNotEmpty) {

    Product product = Product(int.parse(products.first[0]), products.first[1],
        products.first[2], int.parse(products.first[3]), int.parse(products.first[4]));
    listOfProducts.add(product);
    products.removeAt(0);
    
  }

  void applyFilter(List<Product> products, Filter filter) {
    for(int i = 0; i < products.length; i++) {
      final produtc = products[i];
      if(filter.apply(produtc)) {
        print(produtc.toString());
      }
    }
  }

  applyFilter(listOfProducts, FilterByCategory("вода"));
}

class Product {
  final int _id;
  final String _typeOfProduct;
  final String _nameOfProduct;
  final int _price;
  final int _count;

  Product(this._id, this._typeOfProduct, this._nameOfProduct, this._price,
      this._count);

  @override
  String toString() {
    return '$_id $_typeOfProduct $_nameOfProduct $_price руб $_count шт';
  }
}

abstract class Filter {
  bool apply(Product product);
}

class FilterByCategory implements Filter {
  String category;

  FilterByCategory(this.category);
  
  @override
  bool apply(Product product) {
    return product._typeOfProduct == this.category;
  }
}

class FilterByPrice implements Filter {
  int price;

  FilterByPrice(this.price);

  @override
  bool apply(Product product) {
    return product._price <= this.price;
  }
}

class FilterByCount implements Filter {
  int count;

  FilterByCount(this.count);

  @override
  bool apply(Product product) {
    return product._count <= this.count;
  }
}