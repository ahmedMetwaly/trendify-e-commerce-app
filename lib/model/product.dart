import 'category.dart';
import 'description.dart';
import 'in_storage.dart';
import 'product_material.dart';
import 'product_size.dart';
import 'review.dart';

class Product {
  String? id;
  String? title;
  String? brand;
  double? price;
  double? salePrecentage;
  List<ProductSize>? size;
  ProductMaterial? material;
  Description? description;
  String? shippingTerms;
  List<Review>? reviews;
  List<String>? images;
  String? puplishedDate;
  List<String>? colors;
  Category? category;
  List<ProductInStock>? productsInStock;
  Product(
      {required this.id,
      required this.title,
      required this.brand,
      required this.price,
      required this.salePrecentage,
      required this.size,
      required this.material,
      required this.description,
      required this.shippingTerms,
      required this.reviews,
      required this.images,
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
    size =
        json["size"].map<ProductSize>((e) => ProductSize.fromJson(e)).toList();
    /*  if (json['size'] != null) {
      size = <size>[];
      json['size'].forEach((v) {
        productDetails!.add(ProductDescriptionModel.fromJson(v));
      }); */
    material = ProductMaterial.fromJson(json["material"]);
    description = Description.fromJson(json["description"]);
    shippingTerms = json["shippingTerms"];
    reviews = json["reviews"].map<Review>((e) => Review.fromJson(e)).toList();
    images = json["images"];
    puplishedDate = json["puplishedDate"];
    colors = json["colors"];
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
    if (size != null) {
      data['size'] = size!.map((v) => v.toJson()).toList();
    }
    if (material != null) {
      data['material'] = material!.toJson();
    }
    if (description != null) {
      data["description"] = description!.toJson();
    }
    data["shippingTerms"] = shippingTerms;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data["images"] = images;
    data["puplishedDate"] = puplishedDate;
    data["colors"] = colors;
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
