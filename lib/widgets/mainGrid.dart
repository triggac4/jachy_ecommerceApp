import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/collectionModels.dart';
import './gridBuildWidget.dart';

class MainGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    var collection = Provider.of<CollectionItems>(context);
    return GridView.builder(
      padding: EdgeInsets.only(top: 10, left: 8, right: 8),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:300,
        
           crossAxisSpacing: 5, 
           mainAxisSpacing: 5
           ),
      itemBuilder: (_, index) {
        return GridBuild(collection.collection[index].title,
        collection.collection[index].id);
      },
      itemCount: collection.collection.length,
    );
  }
}
