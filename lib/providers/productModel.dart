import 'package:flutter/foundation.dart';

class ShoeSize {
  final List<int> shoe;
  ShoeSize({this.shoe});
}

class ClothSize {
  final Map<String, int> cloth;
  ClothSize({this.cloth});
}

enum Sizes { shoe, clothesByMeasurement, clothesByUniversialSize }

class Product {
  final String id;
  final String title;
  final double price;
  final String size;
  final String image;
  final String description;
  final List<String> availableSizes;
  bool favourite;
  final List<String> collection;
  Product(
      {this.title,
      this.id,
      this.collection,
      this.size,
      this.price,
      this.description,
      this.image,
      this.favourite = false,
      this.availableSizes});
}

class ProductItems with ChangeNotifier {
  List<Product> _product = [
    Product(
        title: 'lumberShirt',
        price: 1000,
        size: 'clothesByUniversialSize',
        id: 'p1',
        description:
            'long Sleeves shirt for almost every occasion good for outings',
        collection: ['3', '4'],
        image: 'images/shoe2.jpg',
        availableSizes: ['M', 'L', 'XL', 'XXL', 'XXXL']),
    Product(
      title: 'lumberbra',
      price: 1000,
      size: 'clothesByMeasurement',
      id: 'p2',
      description:
          'lumber bra for almost every occasion good for outings especially to the beach',
      collection: ['1', '4'],
      image: 'images/shoe2.jpg',
    ),
    Product(
        title: 'shoe',
        price: 1000,
        size: 'shoe',
        description:
            'excellent shoe for almost every occasion good for outings mostly used for jogging',
        id: 'p3',
        collection: ['6', '5'],
        image: 'images/shoe.jpg',
        availableSizes: ['39', '40', '41', '43']),
    Product(
        title: 'footware',
        price: 1000,
        size: 'shoe',
        id: 'p4',
        collection: ['7', '4'],
        description:
            'excellent shoe for almost every occasion good for outings expecially beach or a chilling resturant  ',
        image: 'images/shoe3.jpg',
        availableSizes: ['41', '40', '42']),
    Product(
        title: 'dummyStuff',
        price: 1000,
        size: 'clothesByUniversialSize',
        description: 'dummyStuff oh for almost every occasion good for outings',
        id: 'p5',
        collection: ['8', '4'],
        image: 'images/shoe2.jpg',
        availableSizes: ['M', 'L', 'XL']),
    Product(
        title: 'moreDummies',
        price: 1000,
        size: 'shoe',
        id: 'p6',
        description: 'moreDummies for almost every occasion good for outings',
        collection: ['9', '3'],
        image: 'images/shoe.jpg',
        availableSizes: ['43', '44', '45']),
    Product(
        title: 'extraDummies',
        price: 1000,
        size: 'shoe',
        description: 'extarDummies for almost every occasion good for outings',
        id: 'p7',
        collection: ['7', '8'],
        image: 'images/shoe3.jpg',
        availableSizes: ['39', '40', '41', '42']),
    Product(
        title: 'checkingStuff',
        price: 1000,
        description: 'checkingStuff for almost every occasion good for outings',
        size: 'clothesByMeasurement',
        id: 'p8',
        collection: ['3', '2'],
        image: 'images/shoe2.jpg'),
    Product(
        title: 'soMany',
        price: 1000,
        size: 'shoe',
        description: 'soMany for almost every occasion good for outings',
        id: 'p9',
        collection: ['2', '3'],
        image: 'images/shoe.jpg',
        availableSizes: ['40', '41', '42']),
    Product(
        title: 'itsGetting dere',
        price: 1000,
        size: 'shoe',
        id: 'p10',
        collection: ['1', '7'],
        description:
            'itsGettinngThere for almost every occasion good for outings',
        image: 'images/shoe3.jpg',
        availableSizes: ['39', '40', '41', '43']),
  ];
  List<Product> get product {
    return _product;
  }

  List<Product> groupProductCOllection(id) {
    return _product.where((element) {
      return element.collection.contains(id);
    }).toList();
  }

  List<Product> wherefavourite() {
    List<Product> prod = [];
    prod = _product.where((element) {
      return element.favourite == true;
    }).toList();
    if (prod.isEmpty) {
      return [];
    } else {
      return prod;
    }
  }

  Product findID(String id) {
    return _product.firstWhere((element) => element.id == id);
  }

  void changeFavourite(String id) {
    int index = _product.indexWhere((element) {
      return element.id == id;
    });
    if (index < 0) {
      return;
    }
    _product[index].favourite = !_product[index].favourite;
    notifyListeners();
  }

  void addProduct(Product prod) {
    Product items;
    items = Product(
        availableSizes: prod.availableSizes,
        title: prod.title,
        size: prod.size,
        collection: prod.collection,
        description: prod.description,
        id: DateTime.now().toString(),
        price: prod.price,
        image: prod.image);
    _product.add(items);
    notifyListeners();
  }

  void updateProduct(Product prod) {
    var index = _product.indexWhere((element) => element.id == prod.id);
    _product.removeAt(index);
    Product product = Product(
        availableSizes: prod.availableSizes,
        collection: prod.collection,
        description: prod.description,
        id: prod.id,
        image: prod.image,
        price: prod.price,
        size: prod.size,
        title: prod.title);
        _product.insert(index, product);
        notifyListeners();
  }
  void deleteProduct(String id){
    var index=_product.indexWhere((element) => element.id==id);
  _product.removeAt(index);
    notifyListeners();
  }
}
