import 'package:flutter/material.dart';

class CartDesign extends StatelessWidget {
  final int items;
  final Color color;
  CartDesign({@required this.items,this.color});
 

  @override
  Widget build(BuildContext context) {
    return items==0||items==null?Icon(Icons.shopping_cart,color: color):Stack(children:<Widget>[
      Icon(Icons.shopping_cart,color: color,),
      Positioned(
        top: 0,
        right: 3,
        bottom: 9,
              child: Container(
          decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color:Theme.of(context).primaryColor),
          constraints: BoxConstraints(
            minHeight: 10,
            minWidth:12 
          ),
          child: Text('$items',style: TextStyle(color: Colors.white),),
        alignment: Alignment.center,
        ),
      )
    ]);
  }
}