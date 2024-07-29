import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/admin_models/coupon_model.dart';

class GetCouponsRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<Coupon>> getCoupons() async {
    try {
      final snapshot = await _firestore.collection('coupons').get();
      return snapshot.docs.map((doc) => Coupon.fromJson(doc.data())).toList();
    } catch (error) {
      throw Exception("error on getting coupons $error");
    }
  }
}
