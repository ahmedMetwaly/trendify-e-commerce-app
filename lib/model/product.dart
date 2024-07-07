import 'category.dart';
import 'colors_model.dart';
import 'in_storage.dart';
import 'product_material.dart';
import 'review.dart';

class Product {
  String? id;
  String? title;
  String? brand;
  double? price;
  double? salePrecentage;
  List<String>? availableSizes;
  ProductMaterial? material;
  List<Review>? reviews;
  String? mainImage;
  String? puplishedDate;
  List<ColorsModel>? colors;
  Category? category;
  List<ProductInStock>? productsInStock;
  Product(
      {required this.id,
      required this.title,
      required this.brand,
      required this.price,
      required this.salePrecentage,
      required this.availableSizes,
      required this.material,
      required this.reviews,
      required this.mainImage,
      required this.puplishedDate,
      required this.colors,
      required this.category,
      required this.productsInStock});
  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    brand = json["brand"];
    price = json["price"];
    salePrecentage = json["salePrecentage"];
    availableSizes = json["availableSizes"];
    /*  if (json['size'] != null) {
      size = <size>[];
      json['size'].forEach((v) {
        productDetails!.add(ProductDescriptionModel.fromJson(v));
      }); */
    material = ProductMaterial.fromJson(json["material"]);
    reviews = json["reviews"].map<Review>((e) => Review.fromJson(e)).toList();
    mainImage = json["mainImage"];
    puplishedDate = json["puplishedDate"];
    colors = json["colors"]
        .map<ColorsModel>((e) => ColorsModel.fromJson(e))
        .toList();
    category = Category.fromJson(json["category"]);
    productsInStock = json["productsInStock"]
        .map<ProductInStock>((e) => ProductInStock.fromJson(e))
        .toList();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['brand'] = brand;
    data["price"] = price;
    data["salePrecentage"] = salePrecentage;
    data["availableSizes"] = availableSizes;

    if (material != null) {
      data['material'] = material!.toJson();
    }
    
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data["mainImage"] = mainImage;
    data["puplishedDate"] = puplishedDate;
    if (colors != null) {
      data['colors'] = colors!.map((v) => v.toJson()).toList();
    }
    if (category != null) {
      data["category"] = category!.toJson();
    }
    if (productsInStock != null) {
      data['productsInStock'] =
          productsInStock!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
