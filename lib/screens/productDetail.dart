import 'package:etrade/db/dbHelper.dart';
import 'package:etrade/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  Product product;
  ProductDetail(this.product);
  @override
  State<StatefulWidget> createState() => ProductDetailState(product);
}

DbHelper dbHelper = new DbHelper();
enum Choice{Delete,Update}

class ProductDetailState extends State<ProductDetail> {
  Product product;
  ProductDetailState(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Product Detail for ${product.name}"
        ),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: select,
            itemBuilder: (BuildContext context)=><PopupMenuEntry<Choice>>[
              PopupMenuItem<Choice>(
                value: Choice.Delete,
                child: Text("Delete Product"),
              ),
              PopupMenuItem<Choice>(
                value: Choice.Update,
                child: Text("Update Product"),
              )
            ],
          )
        ],
      ),
      body: Center(
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.shop),
                title: Text(product.name),
                subtitle: Text(product.description),
              ),
              Text(
                  "${product.name} price is: ${product.price}"
              ),
              ButtonTheme.bar(
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Text("Add to cart"),
                      onPressed: (){
                        AlertDialog alertDialog = new AlertDialog(
                          title: Text("Success!"),
                          content: Text("${product.name} added to cart"),
                        );
                        showDialog(
                          context: context,
                          builder: (_)=>alertDialog
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void select(Choice choice) async {
    int result;
    switch(choice){
      case
        Choice.Delete:
          Navigator.pop(context,true);
          result = await dbHelper.delete(product.id);
          if(result != 0){
            AlertDialog alertDialog = new AlertDialog(
              title: Text("Success!"),
              content: Text("Deleted ${product.name}"),
            );
            showDialog(
                context: context,
                builder: (_)=>alertDialog
            );
          }

        break;
      default:
    }

  }

}
