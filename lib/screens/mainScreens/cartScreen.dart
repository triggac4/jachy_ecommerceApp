import 'package:jachyfashion/providers/orderModel.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:jachyfashion/providers/CartModel.dart';

class CartScreen extends StatefulWidget {
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  
  


  Widget build(BuildContext context) {
    final cart = Provider.of<CartItems>(context);
    return Stack(
      children: <Widget>[
        Column(children: <Widget>[
          Card(
              child: Container(
            color: Colors.blueGrey[800],
            width: MediaQuery.of(context).size.width * 1,
            child: Row(children: <Widget>[
              Container(
                  color: Theme.of(context).primaryColor,
                  child: Stack(children: [
                    Text(
                      'N:' + cart.totalAmount().toStringAsFixed(2),
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Positioned(
                      left: 2,
                      child: Text(
                        '=',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    )
                  ])),
              Spacer(),
              Consumer<OrderItems>(
                builder: (_,order,child){
                  return FlatButton(
                onPressed: cart.carts.isEmpty?null: ()async {
                  order.addOrder(cart.carts.values.toList() ,cart.totalAmount());
                  cart.clearCart();
              
                },
                child: Text(
                  'Order Item',
                  style: TextStyle(color:
                   Colors.white),
                ),
                color: Theme.of(context).primaryColor,
              );
                },
              ),
              
            ]),
          )),
          Container(child:Text('Swipe Left To Delete Cart Item If Any',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white),)),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) {
                return Column(
                  children: <Widget>[
                    Dismissible(
                      key:ValueKey(cart.carts.keys.toList()[index]),
                      direction: DismissDirection.endToStart,
                      onDismissed: (_){
                     
                        cart.deleteCart(cart.carts.keys.toList()[index]);  
                        
                      },
                          child: ListTile(
                        leading: Container(
                            width: 100,
                            child: Text(cart.carts.values.toList()[index].name)),
                        title: const Text('Sizes'),
                        subtitle: Container(
                          color: Colors.blueGrey[800],
                          height: 50,
                          child: ListView.builder(
                            itemBuilder: (_, ind) {
                              return Container(
                                  child: Row(
                                children: <Widget>[
                                  Text(
                                    cart.carts.values.toList()[index].size[ind]
                                            ['size'] +
                                        ': ${cart.carts.values.toList()[index].size[ind]['quantity']}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  VerticalDivider(),
                                ],
                              ));
                            },
                            itemCount:
                                cart.carts.values.toList()[index].size.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        trailing:
                            Text('x${cart.carts.values.toList()[index].quantity}'),
                      ),
                    ),
                    Divider()
                  ],
                );
              },
              itemCount: cart.carts.length,
            ),
          ),
        ]),
    
      ],
    );
  }
}
