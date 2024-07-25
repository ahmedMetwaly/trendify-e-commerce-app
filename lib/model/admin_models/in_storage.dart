class ProductInStock {
  String? color;
  int? quantity;
  String? size;
  ProductInStock(
      {required this.color,
      required this.quantity,
      required this.size});
  ProductInStock.fromJson(Map<String, dynamic> json) {
    color = json["color"];
    quantity = json["quantity"];
    size = json["size"];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["color"] = color;
    data["quantity"] = quantity;
    data["size"] = size;

    return data;
  }
}
