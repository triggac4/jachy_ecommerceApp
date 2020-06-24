import 'package:flutter/cupertino.dart';
import '../providers/productModel.dart';

class Cart {
  final double ammount;
  final String name;
  final String prodid;
  final int quantity;
  final List<Map<String, dynamic>> size;

  Cart({this.ammount, this.prodid,this.name, this.quantity, this.size});
}

class CartItems with ChangeNotifier {
  Map<String, Cart> _carts = {};

  Map<String, Cart> get carts {
    return _carts;
  }

  void addCart(Product prod, String size, int quantityz) {
    var inCart = _carts.containsKey(prod.id);
    bool sizes = false;
    Map<String, dynamic> sizeQuan = {};

    sizeQuan.addAll({'size': size, 'quantity': quantityz});
    List<Map<String, dynamic>> sie = [];
    if (inCart) {
      _carts.update(prod.id, (value) {
        int val = value.quantity + quantityz;
        value.size.forEach((element) {
          if (element['size'] == size) {
            sizes = true;
            element.update('quantity', (value) => value + quantityz);
          }
        });
        if (sizes) {
          return Cart(
              name: prod.title,
              quantity: value.quantity + quantityz,
              ammount: prod.price * val,
              prodid: value.prodid,
              size: value.size);
        } else {
          return Cart(
              name: prod.title,
              quantity: value.quantity + quantityz,
              prodid: value.prodid,
              ammount: prod.price * val,
              size: value.size..add(sizeQuan));
        }
      });
    } else {
      _carts.addAll({
        prod.id: Cart(
            ammount: prod.price * quantityz,
            name: prod.title,
            prodid: prod.id,
            quantity: quantityz,
            size: sie..add(sizeQuan))
      });
    }
    notifyListeners();
  }
void clearCart(){
  _carts={};
  notifyListeners();
}

  double totalAmount() {
    double totalAmount = 0;
    _carts.forEach((key, value) {
      totalAmount = totalAmount + value.ammount;
    });
    return totalAmount;
  }

  void deleteCart(String id){
  _carts.removeWhere((key, value) => key==id);
  notifyListeners();
  }
}
