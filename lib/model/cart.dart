import 'product.dart';

class CartProduct {
  Product? product;
  int? quantity;

  CartProduct({required this.product, required this.quantity});
  CartProduct.fromJson(Map<String, dynamic> json) {
    product = Product.fromJson(json['product']);
    quantity = json['quantity'];
  }
  Map<String, dynamic> toJson() {
    Map<String,dynamic> data={};
    data['product']=product!.toJson();
    data['quantity']=quantity;
    return data;
  }
}
