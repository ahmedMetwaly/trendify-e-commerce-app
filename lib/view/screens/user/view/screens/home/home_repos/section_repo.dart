import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../../../model/admin_models/product.dart';

class SectionRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Product>> getProducts() async {
    List<Product> products = [];
    try {
      final brandsData = await _firestore.collection("factories").get();
      //print(brandsData.docs.first["brandName"]);
      for (var brand in brandsData.docs) {
        final snapshot = await _firestore
            .collection('factories')
            .doc(brand["brandName"].toString().toUpperCase())
            .collection("products")
            .get();
        products.addAll(
            snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());
      }
      return products;
    } catch (error) {
      throw Exception("error getting products $error");
    }
  }
}
