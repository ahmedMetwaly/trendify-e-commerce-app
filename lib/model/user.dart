import 'cart.dart';
import 'admin_models/product.dart';

class UserModel {
  String? uid;
  String? name;
  String? email;
  String? imageUrl;
  String? password;
  String? phoneNumber;
  List<Product>? favouriteProducts;
  List<Product>? history;
  String? address;
  List<CartProduct>? cartProducts;
  UserModel(
      {this.uid,
      required this.name,
      required this.email,
      required this.imageUrl,
      required this.password,
      this.phoneNumber,
      this.favouriteProducts,
      this.cartProducts,
      this.address,
      this.history,
      });
  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    password = json["password"];
    imageUrl = json["imageUrl"];
    phoneNumber = json["phoneNumber"];
    if (json['favouriteProducts'] != null) {
      favouriteProducts = <Product>[];
      json['favouriteProducts'].forEach((topic) {
        favouriteProducts!.add(Product.fromJson(topic));
      });
    }
    if (json['cartProducts'] != null) {
      cartProducts = <CartProduct>[];
      json['cartProducts'].forEach((topic) {
        cartProducts!.add(CartProduct.fromJson(topic));
      });
    }
    if (json['history'] != null) {
      history = <Product>[];
      json['history'].forEach((topic) {
        history!.add(Product.fromJson(topic));
      });
    }
    address = json['address'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["uid"] = uid;
    data["name"] = name;
    data["email"] = email;
    data["password"] = password;
    data["imageUrl"] = imageUrl;
    data["phoneNumber"] = phoneNumber;
    if (favouriteProducts != null) {
      data['favouriteProducts'] = favouriteProducts!.map((v) => v).toList();
    }
  if (cartProducts != null) {
      data['cartProducts'] = cartProducts!.map((v) => v).toList();
    }
    if (history != null) {
      data['history'] = history!.map((v) => v).toList();
    }
    data["address"] = address;

    return data;
  }
}
