import 'product.dart';

class BrandModel {
  final String name ;
   List<Product> products;

  BrandModel({required this.name, required this.products});


 /*  FactoryModel.fromJson(Map<String, dynamic> json) {
    if (json["products"] != null) {
      products = <Product>[];
      json["products"].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (products != null) {
      data["products"] = products!.map((v) => v.toJson()).toList();
      }
      return data;
  } */
}
