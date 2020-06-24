import 'package:flutter/cupertino.dart';

class Collection{
final String id;
final String title;
Collection({@required this.id,@required this.title});
}

class CollectionItems with ChangeNotifier{

  List<Collection> _collection=[
    Collection(title:'Collection 1',id:'1'),
    Collection(title:'Collection 2',id:'2'),
    Collection(title:'Collection 3',id:'3'),
    Collection(title:'Collection 4',id:'4'),
    Collection(title:'Collection 5',id:'5'),
    Collection(title:'Collection 6',id:'6'),
    Collection(title:'Collection 7',id:'7'),
    Collection(title:'Collection 8',id:'8'),
    Collection(title:'Collection 9',id:'9'),
  ];

  List<Collection>get collection{
    return _collection;
  }
  void addCollection(Collection collect){
    Collection item=new Collection(id: DateTime.now().toString(),title: collect.title);
_collection.add(item);
notifyListeners();
  }
  void updateCollection(Collection collect){
    int index=_collection.indexWhere((element) => element.id==collect.id);
    if(index<0){
      return;
    }
    _collection.removeAt(index);
    Collection item=new Collection(id: collect.id,title: collect.title);
    _collection.insert(index, item);
    notifyListeners();

  }
  void deleteProduct(String id){
    var index=_collection.indexWhere((element) => element.id==id);
    
    if(index<0){
      return;
    }
  _collection.removeAt(index);
    notifyListeners();
  }
}


