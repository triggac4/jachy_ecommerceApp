import 'package:flutter/material.dart';
import 'package:jachyfashion/screens/mainScreens/orderScreen.dart';
import 'package:provider/provider.dart';
import 'package:jachyfashion/widgets/cartDesign.dart';
import 'package:jachyfashion/widgets/mainGrid.dart';
import './favouriteScreen.dart';
import 'package:jachyfashion/providers/CartModel.dart';
import './cartScreen.dart';
import '../drawerScreen/drawerScreen.dart';

class CollectionScreen extends StatefulWidget {
  @override
  __CollectionScreenState createState() => __CollectionScreenState();
}

class __CollectionScreenState extends State<CollectionScreen> {
  int index = 0;
  List<Widget> change = [
      MainGrid(),
    FavouriteScreen(),
    CartScreen(),
    OrderScreen(),
  ];
  Widget buttomBar({Widget icon, int numb, BuildContext context}) {
    return Expanded(
        child: FlatButton(
      child: icon,
      onPressed: () {
        setState(
          () {
            if (numb == 6) {
              scaffold.currentState.openDrawer();
            } else {
              index = numb;
            }
          },
        );
      },
    ));
  }
final scaffold=GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    
    return Scaffold(
      key: scaffold,
      drawer: MainDrawer(),
      backgroundColor:Theme.of(context).accentColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(child: change[index]),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                ),
                child: Row(children: <Widget>[
                  buttomBar(
                        icon: Icon(Icons.dehaze), numb: 6, context: context),
                  buttomBar(
                          icon: Icon(Icons.category,
                              color: index == 0
                                  ? Theme.of(context).primaryColor
                                  : Colors.black),
                          numb: 0),
                  buttomBar(
                        icon: Icon(Icons.favorite,
                            color: index == 1
                                ? Theme.of(context).primaryColor
                                : Colors.black),
                        numb: 1),
                  buttomBar(
                      icon: Consumer<CartItems>(
                        builder: (_, cart, child) {
                          return CartDesign(
                            items: cart.carts.length,
                            color: index == 2
                                ? Theme.of(context).primaryColor
                                : Colors.black,
                          );
                        },
                      ),
                      numb: 2),
                  buttomBar(
                      icon: Icon(Icons.credit_card,
                          color: index == 3
                              ? Theme.of(context).primaryColor
                              : Colors.black),
                      numb: 3),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
