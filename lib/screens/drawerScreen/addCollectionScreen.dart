import 'package:flutter/material.dart';
import 'package:jachyfashion/providers/collectionModels.dart';
import 'package:provider/provider.dart';

class AddCollectionScreen extends StatefulWidget {
final Collection collection;
AddCollectionScreen(this.collection);

  @override
  _AddCollectionScreenState createState() => _AddCollectionScreenState();
}

class _AddCollectionScreenState extends State<AddCollectionScreen> {
 final _collection =TextEditingController();
 String error='';
 initState(){
   _collection.text=widget.collection==null? '':widget.collection.title;
   super.initState();
 }
  @override
  Widget build(BuildContext context) {
  final collection=  Provider.of<CollectionItems>(context);
    return SingleChildScrollView(
          child: Container( 
         height:MediaQuery.of(context).viewInsets.bottom+MediaQuery.of(context).size.height*0.3,
        
          decoration: BoxDecoration(
            
          color: Colors.blueGrey[800]),
        child: Column(children:<Widget>[
          SizedBox(height: 10,),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal:10),
                      child: TextField(
              decoration:InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
            isDense: true,
            labelText: 'Collection Name',
            fillColor: Colors.blueGrey,
            filled: true,
            
              ),
              controller: _collection,
            ),
          ),
          SizedBox(height: 0,),
          Text('$error',style: TextStyle(color: Colors.white),),
          FlatButton(
            color: Theme.of(context).primaryColor,
            child: Text(widget.collection==null? 'Add Collection':'Update Collection'),
          onPressed: (){
            Collection collect;
if(_collection.text.isEmpty){
setState(() {
  error='please Insert a Collection';
});
}else if(_collection.text.length<3){
  setState(() {
        error='Collection Name Must Be Above 3';
  });
}else{
if(widget.collection==null){
  collect=Collection(id: DateTime.now().toString(),title: _collection.text);
  collection.addCollection(collect);
 setState(() {
        _collection.text='';
 });
 Navigator.of(context).pop();
}  else{
  collect=Collection(id: widget.collection.id,title: _collection.text);
  collection.updateCollection(collect);
 setState(() {
        _collection.text='';
 });
 Navigator.of(context).pop();
}
 
}
          },)
        ]),
        ),
    );
  }
}
