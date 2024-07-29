import 'package:cloud_firestore/cloud_firestore.dart';

class DeleteCouponRepo {
  final String couponCode;
  DeleteCouponRepo({required this.couponCode});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future deleteCoupon() async {
    try {
      await _firestore.collection('coupons').doc(couponCode).delete();
    } catch (error) {
      throw Exception("Error in deleting $error");
    }
  }
}
