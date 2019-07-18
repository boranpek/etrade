import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductDetailState();
}

class ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
      ),
    );
  }

}
