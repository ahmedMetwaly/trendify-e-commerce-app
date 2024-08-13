import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/view/screens/admin/screens/orders/models/order_model.dart';

class GetOrdersRepo{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<OrderModel>> getOrders() async {
    try {
      final snapshot = await _firestore.collection('orders').get();
      print("got from repo ${snapshot.docs.length}");
      return snapshot.docs.map((doc) => OrderModel.fromJson(doc.data())).toList();
    } catch (error) {
      throw Exception("error on getting orders $error");
    }
  }
}