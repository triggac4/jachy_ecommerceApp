import 'package:flutter/material.dart';
import 'package:jachyfashion/providers/productModel.dart';
import 'package:jachyfashion/widgets/productWidget.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var product = Provider.of<ProductItems>(context).wherefavourite();

    return product.isEmpty
        ? Center(
            child: Text('No Favourite Selected',
                style: TextStyle(fontWeight: FontWeight.bold)))
        : ListView.builder(
            itemBuilder: (_, index) {
              return ProductWidget(
                id: product[index].id,
                image: product[index].image,
                title: product[index].title,
              );
            },
            itemCount: product.length);
  }
}
