import 'package:flutter/material.dart';
import 'package:jachyfashion/providers/productModel.dart';
import 'package:jachyfashion/screens/productScreen/selectSizeScreen.dart';
import 'package:provider/provider.dart';

class AboutProduct extends StatelessWidget {
  final String id;
  AboutProduct(this.id);
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductItems>(context);
    final product = products.findID(id);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    child: Hero(

                      tag: id,
                       child: Image.asset(
                        product.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  AppBar(
                    title: Text('About Product'),
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.5),
                  )
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  elevation: 20,
                  color: Colors.blueGrey[700],
                  child: Container(
                    padding:EdgeInsets.symmetric(horizontal:10),
                    height: 200,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Text(
                      '${product.description}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20, color: Colors.white),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              )
            ],
          ),
          Positioned(
              bottom: 15,
              right: 15,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) {
                    return SelectSizeScreen(
                      prodid: id,
                    );
                  }));
                },
                child: Icon(Icons.add_shopping_cart),
                backgroundColor: Theme.of(context).primaryColor,
              ))
        ],
       
      ),
      backgroundColor: Theme.of(context).accentColor,
    );
  }
}
