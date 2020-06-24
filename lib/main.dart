import 'package:flutter/material.dart';
import './providers/productModel.dart';
import 'package:jachyfashion/providers/collectionModels.dart';
import 'package:provider/provider.dart';
import 'package:jachyfashion/screens/mainScreens/collectionScreen.dart';
import './providers/CartModel.dart';
import './providers/orderModel.dart';
void main() {
  runApp(
    MyApp()
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[ 
      ChangeNotifierProvider.value(value: OrderItems()),
      ChangeNotifierProvider.value(value: CollectionItems(),),
      ChangeNotifierProvider.value(value: ProductItems(),),
      ChangeNotifierProvider.value(value: CartItems()),
      ],child: MaterialApp(
      theme: ThemeData(
        primaryColor:Color(0xffff0080),
        accentColor: Colors.blueGrey
      ),
      home: CollectionScreen(),
    ),);
  }
}