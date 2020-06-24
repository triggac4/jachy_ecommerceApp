import 'package:flutter/material.dart';
import 'package:jachyfashion/providers/productModel.dart';
import 'package:jachyfashion/screens/productScreen/selectSizeScreen.dart';
import 'package:provider/provider.dart';
import 'package:jachyfashion/screens/productScreen/aboutProductScreen.dart';
class ProductWidget extends StatefulWidget {
  final String id;
  final String image;
  final String title;

  ProductWidget({
    this.image,
    this.title,
    this.id,
  });
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  Widget build(BuildContext context) {
    var products = Provider.of<ProductItems>(context);
    var product = products.findID(widget.id);
    return Center(
      child: GestureDetector(
       onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
              return AboutProduct(widget.id);
          }));
          },
          child: Padding(
          padding: EdgeInsets.only(top: 10, left: 5, right: 5,bottom: 10),
          child: Stack(children: <Widget>[
                Container(
          height: 200,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(color:Colors.blueGrey.shade800,offset: Offset(4, 5))
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20))),
          child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: Hero(
            tag:widget.id,
               child: Image.asset(
              widget.image,
              fit: BoxFit.cover,
            ),
          ),
          ),
                  ),
                Positioned(
          bottom: 0,
          child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.9,
          color: Colors.black.withOpacity(0.7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                      product.favourite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.pink[500]),
                  onPressed: () {
                    setState(() {
                      products.changeFavourite(widget.id);
                    });
                  }),
              Spacer(),
              Text(
                widget.title,
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              IconButton(
                  icon:
                      Icon(Icons.shopping_cart, color: Colors.pink[500]),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) {
                      return SelectSizeScreen(
                        prodid: widget.id,
                      );
                    }));
                  }),
            ],
          ),
          ))
              ]),
        ),
      ),
    );
  }
}
