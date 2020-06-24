import 'package:flutter/material.dart';
import 'package:jachyfashion/screens/drawerScreen/collectionEditing.dart';
import 'package:jachyfashion/screens/mainScreens/collectionScreen.dart';
import 'package:jachyfashion/screens/drawerScreen/productEditingScreen.dart';

class MainDrawer extends StatelessWidget {
  ListTile listTile(
    BuildContext context,
    IconData icon,
    String text,
    Widget widget
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(text),
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>widget));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Theme.of(context).accentColor,
          child: SafeArea(
              child: Column(
            children: <Widget>[
              listTile(context, Icons.home, 'Homepage',CollectionScreen()),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 0,
              ),
              listTile(context, Icons.shopping_basket, 'Products',ProductEditing()),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 0,
              ),
              listTile(context,Icons.category,'Categories',CollectionEditing()),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 0,
              ),
            ],
          ))),
    );
  }
}
