import 'package:flutter/material.dart';
import 'package:jachyfashion/providers/productModel.dart';
import 'package:jachyfashion/screens/productScreen/productsScreen.dart';
import 'package:provider/provider.dart';

class GridBuild extends StatelessWidget {
  final String collectionName;
  final String collectionId;
  GridBuild(this.collectionName,this.collectionId);
  @override
  Widget build(BuildContext context) {
  var product=  Provider.of<ProductItems>(context);
    return FlatButton(
      padding: EdgeInsets.zero,
      
      onPressed:(){
        Navigator.of(context).push(MaterialPageRoute(builder:(_){
        return ProductsScreen(product.groupProductCOllection(collectionId),);
      }));
    },
          child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.blueGrey[900],),
            child: Text(collectionName,style: TextStyle(color:Color(0xffff0080),fontWeight:FontWeight.bold),),
            alignment: Alignment.center,
      ),
    );
  }
}
