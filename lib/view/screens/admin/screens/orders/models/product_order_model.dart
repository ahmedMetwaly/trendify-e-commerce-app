class ProductOrder {
  late final String name;
  late final double price;
  late final String imageUrl;
  late final String color;
  late final String size;
  late final String brand;
  late final int quantity;

  ProductOrder({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.color,
    required this.size,
    required this.quantity,
    required this.brand,

    //take the main image of product
  });
  ProductOrder.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    price = json["price"];
    imageUrl = json["imageUrl"];
    color = json["color"];
    size = json["size"];
    brand = json["brand"];
    quantity = int.parse(json["quantity"]);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["name"] = name;
    data["price"] = price;
    data["imageUrl"] = imageUrl;
    data["color"] = color;
    data["size"] = size;
    data["brand"] = brand;
    data["quantity"] = quantity.toString();
    return data;
  }
}
