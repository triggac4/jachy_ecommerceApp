import 'package:flutter/material.dart';
import 'package:jachyfashion/providers/CartModel.dart';
import 'package:jachyfashion/providers/productModel.dart';
import 'package:provider/provider.dart';

class SelectSizeScreen extends StatefulWidget {
  final String prodid;
  SelectSizeScreen({ this.prodid});
  @override
  _SelectSizeScreenState createState() => _SelectSizeScreenState();
}

class _SelectSizeScreenState extends State<SelectSizeScreen> {
  String selectedSize;
  String errorText;
  int quantity;
  initState() {
    quantity = 0;
    selectedSize = '';
    errorText = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductItems>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: Column(children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  products.findID(widget.prodid).image,
                  fit: BoxFit.fill,
                ),
              ),
              AppBar(
                title: Text('Size Collection'),
                backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(0.5),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Text(
            'Please Select a Size from the Scrollable List Below ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Theme.of(context).accentColor,
              elevation: 10,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 1,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      products.findID(widget.prodid).availableSizes.map((e) {
                    return Card(
                      color: selectedSize == e
                          ? Theme.of(context).primaryColor
                          : Colors.blueGrey[800],
                      elevation: selectedSize == e ? 20 : 0,
                      child: Row(
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  selectedSize = e;
                                });
                        
                              },
                              child: Text(
                                e,
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Text(
            errorText,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          const Text(
            'Please Select Quantity Needed',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: Card(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      if (quantity > 0) {
                        quantity = quantity - 1;
                      }
                    });
                  },
                  child: Container(
                    height: 30,
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: 20),
                    ),
                    alignment: Alignment.center,
                    color: Theme.of(context).primaryColor,
                  ),
                )),
                Expanded(
                    child: Container(
                        height: 30,
                        child: Text('$quantity'),
                        alignment: Alignment.center)),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      quantity = quantity + 1;
                    });
                  },
                  child: Container(
                      height: 30,
                      child: Text('+', style: TextStyle(fontSize: 20)),
                      alignment: Alignment.center,
                      color: Theme.of(context).primaryColor),
                ))
              ],
            )),
          )
        ]),
        floatingActionButton: Consumer<CartItems>(
          builder: (_, cart, child) {
            return FloatingActionButton(
              onPressed: () {
                if (selectedSize == '' || quantity == 0) {
                  setState(() {
                    errorText = 'please select a Size and quantity';
                  });
                  return;
                }
                setState(() {
                  errorText = '';
                });
                cart.addCart(products.findID(widget.prodid), selectedSize, quantity);
                Navigator.of(context).pop();
              
              },
              child: Icon(Icons.add_shopping_cart),
              backgroundColor: Theme.of(context).primaryColor,
            );
          },
        ));
  }
}
