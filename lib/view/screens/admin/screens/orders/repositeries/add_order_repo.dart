import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/view/screens/admin/screens/orders/models/order_model.dart';

class AddOrderRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addNewOrder(OrderModel order) async {
    try {
      await _firestore.collection("orders").doc(order.id).set(order.toJson());
    } catch (error) {
      throw Exception("Error while saving order to the database $error");
    }
  }
}
