class Product{
  int id;
  String name;
  String description;
  double price;

  Product(this.name,this.description,this.price);
  Product.withId(this.id,this.name,this.description,this.price);

  int get getId => id;
  String get getName => name;
  String get getDescription => description;
  double get getPrice => price;

  set setName(String name) {
    if(name.length > 2)
      this.name = name;
  }

  set setPrice(double price) {
    if(price > 0)
      this.price = price;
  }

  set setDescription(String description) {
    this.description = description;
  }

  Map<String,dynamic> toMap() {
    var map = Map<String,dynamic>();
    map["name"] = name;
    map["description"] = description;
    map["price"] = price;
    if(id != null)
      map["id"] = id;
    return map;
  }

  Product.fromObject(dynamic o) {
    this.id = o["Id"];
    this.name = o["Name"];
    this.description = o["Description"];
    this.price = double.tryParse(o["Price"].toString());
  }
}