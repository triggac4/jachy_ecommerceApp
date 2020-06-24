import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './drawerScreen.dart';
import 'package:jachyfashion/providers/productModel.dart';
import './addProductScreen.dart';

class ProductEditing extends StatefulWidget {
  @override
  _ProductEditingState createState() => _ProductEditingState();
}

class _ProductEditingState extends State<ProductEditing> {
  @override
  Widget build(BuildContext context) {
    final prod=Provider.of<ProductItems>(context);
    final product = prod.product;
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
            title: Text('Products'),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => AddProduct(null)));
                  })
            ]),
        drawer: MainDrawer(),
        body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: product.length,
            itemBuilder: (_, index) {
              return Card(
                  color: Colors.blueGrey[800],
                  child: Row(children: <Widget>[
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 19,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                              width: 38,
                              child: Image.asset(product[index].image,
                                  fit: BoxFit.fill))),
                    ),
                    SizedBox(width: 20),
                    Text('${product[index].title}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Spacer(),
                    IconButton(
                        icon: Icon(Icons.edit,
                            color: Theme.of(context).primaryColor),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => AddProduct(product[index])));
                        }),
                    IconButton(
                        icon: Icon(Icons.delete,
                            color: Theme.of(context).primaryColor),
                        onPressed: () {
                        prod.deleteProduct(product[index].id);                          
                        }),
                  ]));
            }));
  }
}
