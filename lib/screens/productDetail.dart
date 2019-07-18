import 'package:etrade/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  Product product;
  ProductDetail(this.product);
  @override
  State<StatefulWidget> createState() => ProductDetailState(product);
}

class ProductDetailState extends State<ProductDetail> {
  Product product;
  ProductDetailState(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail for ${product.name}"),
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
                      child: Text("Add to card"),
                      onPressed: (){

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

}
