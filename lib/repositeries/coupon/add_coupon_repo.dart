import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/admin_models/coupon_model.dart';

class AddNewCouponRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addNewCoupon(Coupon coupon) async {
    try {
      await _firestore
          .collection("coupons")
          .doc(coupon.couponCode!.trim().toUpperCase())
          .set(coupon.toJson());
    } catch (error) {
      throw Exception("Error while saving data to the database $error");
    }
  }
}
