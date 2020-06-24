import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:jachyfashion/providers/orderModel.dart';
import 'package:jachyfashion/widgets/orderWidget.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderItems>(context).orders;
    return orders.isEmpty
        ? Center(
            child: Text('You Dont Have Any Orders Yet Common Start Shopping',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )))
        : ListView.builder(
            itemBuilder: (_, index) {
              return OrderWidget(orders[index]);
            },
            itemCount: orders.length,
          );
  }
}
