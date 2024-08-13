import 'package:image_picker/image_picker.dart';
import 'product.dart';

class CategoryModel {
  String? gender;
  String? section;
  String? imageUrl;
  XFile? imageFile;
  List<Product>? products;
  CategoryModel(
      {this.gender,
      this.section,
      this.imageUrl,
      this.imageFile,
      this.products});
  CategoryModel.fromJson(Map<String, dynamic> json) {
    gender = json["gender"];
    section = json["section"];
    imageUrl = json["imageUrl"];
    products =
        json["products"].map<Product>((e) => Product.fromJson(e)).toList();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["gender"] = gender;
    data["section"] = section;
    data["imageUrl"] = imageUrl;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
