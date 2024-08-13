import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateOrderRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future updateOrderState(String orderID, String state) async {
    try {
      await _firestore
          .collection("orders")
          .doc(orderID)
          .update({"state": state}).catchError((error) {
        throw Exception('Failed to update order data $error');
      });
    } catch (error) {
      //print(error);
      throw Exception('Failed to update order data $error');
    }
  }
}
