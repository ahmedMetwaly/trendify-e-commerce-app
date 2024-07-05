class ProductInStock {
  String? color;
  int? quantity;
  List<String>? availableSizes;
  ProductInStock(
      {required this.color,
      required this.quantity,
      required this.availableSizes});
  ProductInStock.fromJson(Map<String, dynamic> json) {
    color = json["color"];
    quantity = json["quantity"];
    availableSizes = json["availableSizes"];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["color"] = color;
    data["quantity"] = quantity;
    data["availableSizes"] = availableSizes;

    return data;
  }
}
