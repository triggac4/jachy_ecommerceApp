import 'package:flutter/cupertino.dart';
import 'package:jachyfashion/providers/CartModel.dart';

class Order {
  final DateTime date;
  final String id;
  final List<Cart> cart;
  final double amount;

Order({this.id,this.amount,this.cart,this.date});
}
class OrderItems with ChangeNotifier{
List<Order> _orders=[];

List<Order> get orders{
  return _orders;
}

void addOrder(List<Cart> cart,double amount ){
  DateTime date =DateTime.now();
_orders.add(Order(amount: amount,id: DateTime.now().toString(),date:date,cart: cart ));
notifyListeners();
}

}