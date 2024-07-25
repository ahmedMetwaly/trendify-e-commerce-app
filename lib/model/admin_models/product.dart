import 'category.dart';
import 'colors_model.dart';
import 'in_storage.dart';
import 'product_material.dart';
import 'review.dart';

class Product {
  String? id;
  String? title;
  String? brand;
  String? price;
  String? salePrecentage;
  List<String>? availableSizes;
  String? sizeImage;
  ProductMaterial? material;
  List<Review>? reviews;
  String? mainImage;
  String?
      puplishedDate; //TODO:: new section from date if less than 10 days from published date
  List<ColorsModel>? colors;
  CategoryModel? category;
  List<ProductInStock>? productsInStock;
  String? productQuantity;
  Product(
      {this.id,
      required this.title,
      required this.brand,
      required this.price,
      required this.salePrecentage,
      required this.availableSizes,
      this.sizeImage,
      required this.material,
      this.reviews,
      this.mainImage,
      required this.puplishedDate,
      required this.colors,
      required this.category,
      this.productQuantity,
      this.productsInStock});
  Product.fromJson(Map<String, dynamic> json) {
    print("start from json");
    id = json["id"];
    print("id from json");

    title = json["title"];
    print("title from json");

    brand = json["brand"];
    print("brand from json");

    price = json["price"];
    print("price from json");
    salePrecentage = json["salePrecentage"];
    print("salePrecentage from json");
    availableSizes = json["availableSizes"].cast<String>();
    print(" availableSizes from json");
    sizeImage = json["sizeImage"];
    print("sizeImage from json");
    productQuantity = json["productQuantity"];
    print("productQuantity from json");
    material = ProductMaterial.fromJson(json["material"]);
    print("material from json");
    reviews = json["reviews"].map<Review>((e) => Review.fromJson(e)).toList();
    print("reviews from json");
    mainImage = json["mainImage"];
    print("mainImage from json");
    puplishedDate = json["puplishedDate"];
    print("puplishedDate from json");

    colors = json["colors"]
        .map<ColorsModel>((e) => ColorsModel.fromJson(e))
        .toList();
    print("colors from json");
    category = CategoryModel.fromJson(json["category"]);
    print("category from json");
    productsInStock = json["productsInStock"]
        .map<ProductInStock>((e) => ProductInStock.fromJson(e))
        .toList();
    print("productsInStock from json");
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['brand'] = brand;
    data["price"] = price;
    data["salePrecentage"] = salePrecentage;
    data["availableSizes"] = availableSizes;
    data["sizeImage"] = sizeImage;
    data["productQuantity"] = productQuantity;
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
