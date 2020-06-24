import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import '../providers/orderModel.dart';
import '../providers/productModel.dart';

class OrderWidget extends StatefulWidget {
  final Order order;
  OrderWidget(this.order);
  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[800],
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
        height: expand ? 200 : 50,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            ListTile(
              leading: Container(
                width: 100,
                child: Text('${widget.order.date.toString().substring(0, 10)}',
                    style: TextStyle(color: Colors.white)),
              ),
              title: Stack(
                children: <Widget>[
                  Text(
                    'N${widget.order.amount}',
                    style: TextStyle(color: Colors.green),
                  ),
                  Positioned(
                      left: 2,
                      child: Text('=',
                          style: TextStyle(fontSize: 15, color: Colors.green)))
                ],
              ),
              trailing: IconButton(
                icon: Icon(
                  expand ? Icons.expand_less : Icons.expand_more,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    expand = !expand;
                  });
                },
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: expand ? 100 : 0,
              child: SingleChildScrollView(
                child: Column(
                    children: widget.order.cart.map((cartz) {
                  return ListTile(
                    leading: Container(
                        width: 100,
                        child: Consumer<ProductItems>(
                          builder: (_, product, child) {
                            return Text(
                                '${product.findID(cartz.prodid).title}');
                          },
                        )),
                    title: const Text('Text'),
                    subtitle: Container(
                      height: 30,
                      child: ListView.builder(
                        itemBuilder: (_, ind) {
                          return Container(
                              child: Row(
                            children: <Widget>[
                              Text(
                                cartz.size[ind]['size'] +
                                    ': ${cartz.size[ind]['quantity']}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              VerticalDivider(),
                            ],
                          ));
                        },
                        itemCount: cartz.size.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  );
                }).toList()),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
