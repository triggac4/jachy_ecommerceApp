import 'package:flutter/material.dart';
import 'package:jachyfashion/providers/productModel.dart';
import 'package:jachyfashion/widgets/productWidget.dart';
class ProductsScreen extends StatelessWidget {
  final List<Product> product;
 
  ProductsScreen(this.product);
  @override
 
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar:AppBar(backgroundColor:Colors.transparent,
      title: Text('Products'),
      elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom:10),
        itemBuilder: (_,index){
        return ProductWidget(image: product[index].image,
          title: product[index].title,
          id: product[index].id,
          );
        
      },itemCount:product.length),
           );
  }
}