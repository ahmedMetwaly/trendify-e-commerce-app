import 'package:shop_app/model/user.dart';
import 'product_order_model.dart';

class OrderModel {
  late final String id;
  late final UserModel user;
  late final String orderDate;
  late final String orderTime;
  late final String total;
  late final List<ProductOrder> products;
  late final String salePrecentage;
  late final String paymentMethod;
  late final String deliveryAmount;
  late final String state;
  OrderModel(
      {required this.id,
      required this.user,
      required this.orderDate,
      required this.orderTime,
      required this.total,
      required this.products,
      required this.salePrecentage,
      required this.paymentMethod,
      required this.deliveryAmount,
      required this.state});
  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    print("got id");
    user = UserModel.fromJson(json['user']);
    print("got user");

    orderDate = json['order_date'];
    orderTime = json['order_time'];
    print("got order date");

    total = json["total"];
    print("got total");

    products = List<ProductOrder>.from(
        json["products"].map((x) => ProductOrder.fromJson(x)));
    print("got products");

    salePrecentage =json["sale_percentage"];

    print("got sale precentage");

    paymentMethod = json['payment_method'];
    print("got payment_method");

     deliveryAmount = json['delivery_amount'];
    print("got delivery_amount");

    state = json['state'];
    print("state");
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    data["user"] = user.toJson();
    data["order_date"] = orderDate;
    data["order_time"] = orderTime;
    data["total"] = total;
    data["products"] = products.map((v) => v.toJson()).toList();
    data["sale_percentage"] = salePrecentage;
    data["payment_method"] = paymentMethod;
    data["delivery_amount"] = deliveryAmount;
    data["state"] = state;
    return data;
  }
}
