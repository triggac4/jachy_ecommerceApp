import 'package:jachyfashion/providers/productModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:jachyfashion/providers/collectionModels.dart';

class AddProduct extends StatefulWidget {
  final Product editProduct;
  AddProduct(this.editProduct);
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _form = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final _description = FocusNode();
  final _price = FocusNode();
  List<String> clothesByUniversialSize = ['M', 'L', 'XL', 'XXL', 'XXXL'];
  List<String> shoe = [
    '30',
    '32',
    '33',
    '34',
    '35',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47'
  ];
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _description.dispose();
    _price.dispose();
    _rowScrollController.dispose();
  }

  void focusonme(focus) {
    FocusScope.of(context).requestFocus(focus);
  }

  final _rowScrollController = ScrollController();
  Widget forRow(e) {
    return Card(
      color: availableSizes.contains(e)
          ? Theme.of(context).primaryColor
          : Colors.blueGrey[800],
      elevation: availableSizes.contains(e) ? 20 : 0,
      child: Row(
        children: <Widget>[
          FlatButton(
              onPressed: () {
                setState(() {
                  if (availableSizes.contains(e)) {
                    availableSizes.remove(e);
                  } else {
                    availableSizes.add(e);
                  }
                });
              },
              child: Text(
                e,
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }

  Widget textField(
      value,
      String text,
      int lines,
      TextInputAction textInputAction,
      TextInputType textInputType,
      Function function,
      FocusNode focusNode,
      Function onSubmit,
      Function onValidate) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: text,
        filled: true,
        fillColor: Colors.blueGrey[800],
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2),
            borderRadius: BorderRadius.circular(10)),
        focusColor: Colors.blueGrey[600],
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2),
            borderRadius: BorderRadius.circular(10)),
      ),
      initialValue: value,
      cursorColor: Colors.white,
      maxLines: lines,
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      onEditingComplete: () {
        function();
      },
      onSaved: (value) {
        onSubmit(value);
      },
      validator: (value) {
        return onValidate(value);
      },
    );
  }

  onsubmitTitle(value) {
    item = Product(
      title: value,
      description: item.description,
      id: item.id,
      image: item.image,
      price: item.price,
    );
  }

  onsubmitPrice(value) {
    item = Product(
      title: item.title,
      description: item.description,
      id: item.id,
      image: item.image,
      price: double.parse(value),
    );
  }

  onsubmitDescription(value) {
    item = Product(
      title: item.title,
      description: value,
      id: item.id,
      image: item.image,
      price: item.price,
    );
  }

  String onValidateTitle(String value) {
    if (value.isEmpty || value == null) {
      return 'please insert a title';
    } else if (value.length < 5) {
      return 'value must be above 5';
    } else {
      return null;
    }
  }

  String onValidateDescription(String value) {
    if (value.isEmpty || value == null) {
      return 'please insert a description';
    } else if (value.length < 15) {
      return 'value must be above 15';
    } else {
      return null;
    }
  }

  String onValidatePrice(String value) {
    if (double.tryParse(value) == null) {
      return 'this is not a valid number';
    } else {
      return null;
    }
  }

  List<String> availableSizes = [];
  String measurementType = 'clothesByUniversialSize';
  List<String> collect = [];
  List<String> something = [''];
  Product item = Product(
    title: '',
    description: '',
    price: 0,
    image: '',
    id: '',
  );
  ProductItems product;
  String error = '';

  @override
  void initState() {
    collect = widget.editProduct == null ? [] : widget.editProduct.collection;
    measurementType =
        widget.editProduct == null ? 'shoe' : widget.editProduct.size;
    availableSizes = widget.editProduct == null
        ? []
        : widget.editProduct.availableSizes == null
            ? []
            : widget.editProduct.availableSizes;

    super.initState();
  }

  void saveForm() {
    if (_form.currentState.validate()) {
      if (availableSizes.isNotEmpty && collect.isNotEmpty) {
        _form.currentState.save();
        if (widget.editProduct == null) {
          item = Product(
              availableSizes: availableSizes,
              size: measurementType,
              collection: collect,
              description: item.description,
              id: DateTime.now().toString(),
              image: 'images/shoe3.jpg',
              price: item.price,
              title: item.title);
          product.addProduct(item);
          Navigator.of(context).pop();
        } else {
          item = Product(
              availableSizes: availableSizes,
              size: measurementType,
              collection: collect,
              description: item.description,
              id: widget.editProduct.id,
              image: widget.editProduct.image,
              price: item.price,
              title: item.title);
          product.updateProduct(item);
          Navigator.of(context).pop();
        }
      } else if (measurementType == 'clothesByMeasurement' &&
          collect.isNotEmpty) {
        _form.currentState.save();
        if (widget.editProduct == null) {
          item = Product(
              size: measurementType,
              collection: collect,
              description: item.description,
              id: DateTime.now().toString(),
              image: 'images/shoe3.jpg',
              price: item.price,
              title: item.title);
          product.addProduct(item);
          Navigator.of(context).pop();
        } else {
          item = Product(
              size: measurementType,
              collection: collect,
              description: item.description,
              id: widget.editProduct.id,
              image: widget.editProduct.image,
              price: item.price,
              title: item.title);
          product.updateProduct(item);
          Navigator.of(context).pop();
        }
      } else {
        setState(() {
          error = 'please select a collection and a measeurement sizes ';
        });
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    product = Provider.of<ProductItems>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
            title: Text('Update/Add Product'),
            backgroundColor: Colors.transparent,
            elevation: 0),
        backgroundColor: Theme.of(context).accentColor,
        body: Form(
            key: _form,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              children: <Widget>[
                SizedBox(height: 6),
                textField(
                    widget.editProduct == null
                        ? null
                        : widget.editProduct.title,
                    'title',
                    1,
                    TextInputAction.next,
                    TextInputType.text,
                    () {
                      focusonme(_description);
                    },
                    null,
                    (value) {
                      onsubmitTitle(value);
                    },
                    onValidateTitle),
                SizedBox(height: 10),
                textField(
                    widget.editProduct == null
                        ? null
                        : widget.editProduct.description,
                    'description',
                    3,
                    TextInputAction.next,
                    TextInputType.text,
                    () {
                      focusonme(_price);
                    },
                    _description,
                    (value) {
                      onsubmitDescription(value);
                    },
                    onValidateDescription),
                SizedBox(height: 10),
                textField(
                    widget.editProduct == null
                        ? null
                        : widget.editProduct.price.toString(),
                    'price',
                    1,
                    TextInputAction.next,
                    TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    null,
                    _price, (value) {
                  onsubmitPrice(value);
                }, onValidatePrice),
                SizedBox(height: 10),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Add Product Collection',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Consumer<CollectionItems>(
                      builder: (_, collection, child) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[800],
                            borderRadius: BorderRadius.circular(10)),
                        child: Scrollbar(
                          controller: _scrollController,
                          isAlwaysShown: false,
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              children: collection.collection.map((e) {
                                return InkWell(
                                    onTap: () {
                                      if (collect.contains(e.id)) {
                                        setState(() {
                                          collect.remove(e.id);
                                        });
                                      } else {
                                        setState(() {
                                          collect.add(e.id);
                                        });
                                      }
                                    },
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                            decoration: BoxDecoration(
                                              color: collect.contains(e.id)
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : Colors.blueGrey[800],
                                            ),
                                            height: 30,
                                            alignment: Alignment.center,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1,
                                            child: Text(
                                              e.title,
                                              style: TextStyle(
                                                  color: collect.contains(e.id)
                                                      ? Colors.black
                                                      : Colors.white),
                                            )),
                                        Divider(
                                          color: Theme.of(context).primaryColor,
                                          height: 3,
                                        )
                                      ],
                                    ));
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Measurement in:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    DropdownButton(
                      dropdownColor: Colors.blueGrey[800],
                      items: [
                        DropdownMenuItem(
                          child: Text('shoe',
                            style: TextStyle(
                                color:
                                    measurementType == 'shoe'
                                        ? Theme.of(context).primaryColor
                                        : Colors.white),),
                          value: 'shoe',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'clothesByUniversialSize',
                            style: TextStyle(
                                color:
                                    measurementType == 'clothesByUniversialSize'
                                        ? Theme.of(context).primaryColor
                                        : Colors.white),
                          ),
                          value: 'clothesByUniversialSize',
                        ),
                        DropdownMenuItem(
                          child: Text('clothesByMeasurement',
                              style: TextStyle(
                                  color:
                                      measurementType == 'clothesByMeasurement'
                                          ? Theme.of(context).primaryColor
                                          : Colors.white)),
                          value: 'clothesByMeasurement',
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          measurementType = value;
                          availableSizes = [];
                        });
                      },
                      value: measurementType,
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Scrollbar(
                    controller: _rowScrollController,
                    child: ListView(
                        controller: _rowScrollController,
                        scrollDirection: Axis.horizontal,
                        children: measurementType == 'clothesByUniversialSize'
                            ? clothesByUniversialSize.map((e) {
                                return forRow(e);
                              }).toList()
                            : measurementType == 'shoe'
                                ? shoe.map((e) {
                                    return forRow(e);
                                  }).toList()
                                : something
                                    .map((e) => Container(
                                        child: Text(
                                            'would be measured before placing order')))
                                    .toList()),
                  ),
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            )),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              saveForm();
            }));
  }
}
