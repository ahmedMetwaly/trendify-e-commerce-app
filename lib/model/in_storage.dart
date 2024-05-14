import 'package:shop_app/model/product_size.dart';

class ProductInStock {
  String? color;
  int? quantity;
  ProductSize? size;
  ProductInStock({required this.color, required this.quantity, required this.size});
  ProductInStock.fromJson(Map<String, dynamic> json) {
    color = json["color"];
    quantity = json["quantity"];
    size = ProductSize.fromJson(json["size"]);
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["color"] = color;
    data["quantity"] = quantity;
    if (size != null) {
      data["size"] = size!.toJson();
    }
    return data;
  }
}
