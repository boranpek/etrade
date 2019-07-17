class Product{
  int id;
  String name;
  String description;
  double price;

  Product(this.name,this.description,this.price);
  Product.withId(this.id,this.name,this.description,this.price);
}