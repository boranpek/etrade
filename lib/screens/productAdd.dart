import 'package:etrade/db/dbHelper.dart';
import 'package:etrade/models/product.dart';
import 'package:flutter/material.dart';

class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>ProductAddState();
}

class ProductAddState extends State<ProductAdd> {
  DbHelper dbHelper = new DbHelper();
  
  TextEditingController txtName = new TextEditingController();
  TextEditingController txtDescription = new TextEditingController();
  TextEditingController txtPrice = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a product"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: txtName,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: txtDescription,
              decoration: InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: txtPrice,
              decoration: InputDecoration(labelText: "Price"),
            ),
            FlatButton(
              child: Text("Add"),
              onPressed: (){add();},
            )
          ],
        ),
      )

    );
  }

  void add() async {
    int result = await dbHelper.insert(Product(txtName.text,txtDescription.text,double.tryParse(txtPrice.text)));
    if(result != 0)
      Navigator.pop(context,true);
  }
}