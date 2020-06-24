import 'package:jachyfashion/screens/drawerScreen/addCollectionScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './drawerScreen.dart';
import 'package:jachyfashion/providers/collectionModels.dart';

class CollectionEditing extends StatefulWidget {
  @override
  _CollectionEditingState createState() => _CollectionEditingState();
}

class _CollectionEditingState extends State<CollectionEditing> {

 Future<void> showBottomPage(Collection collect){
return showModalBottomSheet(context: context, builder: (ctx){
          return AddCollectionScreen(collect);
          });
  }
  
final scaffold=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final collect=Provider.of<CollectionItems>(context);
    final collection = collect.collection;
    return Scaffold(
      key:scaffold,
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          title: Text('Collections'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon:Icon(Icons.add),
              onPressed: (){
               showBottomPage(null);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: collection.length,
            itemBuilder: (_, index) {
              return Column(children: <Widget>[
                Card(
                    color: Colors.blueGrey[800],
                    child: Row(children: <Widget>[
                      SizedBox(width: 5),
                      CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Text('${index + 1}')),
                      SizedBox(width: 20),
                      Text(collection[index].title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      Row(children: <Widget>[
                        IconButton(
                            onPressed: () {
                               showBottomPage(collection[index]);
                            },
                            icon: Icon(Icons.edit,
                                color: Theme.of(context).primaryColor)),
                        IconButton(
                            onPressed: () {
                                collect.deleteProduct(collection[index].id);
                              },
                            icon: Icon(Icons.delete,
                                color: Theme.of(context).primaryColor)),
                      ]),
                    ])),
              ]);
            }));
  }
}
