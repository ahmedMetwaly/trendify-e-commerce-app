import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/model/admin_models/product.dart';

import '../../model/admin_models/brand_model.dart';

class AdminFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /*  Future<String> saveProductData(Product product) async {
    try {
      //print("user id :${user.uid}");
      final document =
          await _firestore.collection('products').add(product.toJson());
      return document.id;
    } catch (error) {
      // debug//print('Error saving user data: $error');
      throw Exception("Error while saving data to the database $error");
    }
  }
 */
//get brands
  Future<List<BrandModel>> getBrands() async {
    try {
      List<BrandModel> brands = [];
      final brandsData = await _firestore.collection("factories").get();
      //print(brandsData.docs.first["brandName"]);
      for (var brand in brandsData.docs) {
        final snapshot = await _firestore
            .collection('factories')
            .doc(brand["brandName"].toString().toUpperCase())
            .collection("products")
            .get();

        final List<Product> products =
            snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList();
        brands.add(BrandModel(name: brand["brandName"], products: products));
      }

      return brands;
    } catch (error) {
      throw Exception("Error while getting brands from the database $error");
    }
  }

//get products of specifc brand
  Future<List<Product>> getProductsOfBrand(String brand) async {
    try {
      final snapshot = await _firestore
          .collection("factories")
          .doc(brand.trim().toUpperCase())
          .collection('products')
          .get();
      final List<Product> products =
          snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList();
      return products;
    } catch (error) {
      throw Exception("Error while getting products from the database $error");
    }
  }

// add product
  Future<String> addProduct(Product product) async {
    try {
      //print("user id :${user.uid}");
      final factoryName = _firestore
          .collection('factories')
          .doc(product.brand!.trim().toUpperCase());
      await factoryName.set({"brandName": product.brand!.toUpperCase()});
      final document =
          await factoryName.collection("products").add(product.toJson());
      return document.id;
    } catch (error) {
      // debug//print('Error saving user data: $error');
      throw Exception("Error while saving data to the database $error");
    }
  }

  Future updateProduct(Product product) async {
    try {
      //print("user id :${user.uid}");
      final factoryName = _firestore
          .collection('factories')
          .doc(product.brand!.trim().toUpperCase());
      await factoryName.set({"brandName": product.brand!.toUpperCase()});

      await factoryName
          .collection("products")
          .doc(product.id!)
          .set(product.toJson());
    } catch (error) {
      // debug//print('Error saving user data: $error');
      throw Exception("Error while saving data to the database $error");
    }
  }

  /* Future getProductsData(String productId) async {
    try {
      final documentSnapshot =
          await _firestore.collection('products').doc(productId).get();
      if (documentSnapshot.exists) {
        return Product.fromJson(documentSnapshot.data() ?? {});
      } else {
        return {}; // Return empty map if product doesn't exist
      }
    } catch (error) {
      // Handle errors appropriately
      throw Exception('Error getting product data: $error');
      ////print('Error getting user data: $error');
      //return {}; // Return empty map on error
    }
  } */
/* 
  Future updataProductData(
      {required String productId,
      required String brand,
      required String field,
      required dynamic data}) async {
    //print("userId $userId");

    try {
      await _firestore
          .collection("factories")
          .doc(brand)
          .collection('products')
          .doc(productId)
          .update({field: data}).catchError((error) {
        throw Exception('Failed to update product data $error');
      });
    } catch (error) {
      //print(error);
      throw Exception('Failed to update product data $error');
    }
  } */
  Future deleteImage(String imageUrl) async {
    try {
      final storage = FirebaseStorage.instance;
      final reference = storage.refFromURL(imageUrl);
      reference.delete();
    } catch (error) {
      throw Exception("Faild to delete Image $error");
    }
  }

  Future<String> uploadImage(
      {required String brand,
      required String productId,
      required XFile image,
      required String field}) async {
    try {
      final storage = FirebaseStorage.instance;
      final imageName = '$productId$field.jpg';
      final reference =
          storage.ref().child('products_main_pictures/$imageName');
      final uploadTask = reference.putFile(File(image.path));
      final snapshot = await uploadTask.whenComplete(() => null);
      final url = await snapshot.ref.getDownloadURL();
      await updateProductField(
          brand: brand, productId: productId, field: field, data: url);
      return url.toString();
    } catch (error) {
      //print("error yad");
      throw Exception("Faild to Upload Image $error");
    }
  }

  Future<List<String>> uploadImages(
      {required String productId,
      required String colorCode,
      required int index,
      required List<File> images}) async {
    try {
      final storage = FirebaseStorage.instance;
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        final imageName = '$productId$colorCode${i + 1}.jpg';
        final reference =
            storage.ref().child('products_main_pictures/$imageName');
        final uploadTask = reference.putFile(images[i]);
        final snapshot = await uploadTask.whenComplete(() => null);
        final url = await snapshot.ref.getDownloadURL();
        imageUrls.add(url);
      }
      return imageUrls;
    } catch (error) {
      //print("error yad");
      throw Exception("Faild to Upload Image");
    }
  }

//TODO:: check if change the brand
  Future updateProductField(
      {required String brand,
      required String productId,
      required String field,
      required dynamic data}) async {
    //print("userId $userId");

    try {
      await _firestore
          .collection("factories")
          .doc(brand)
          .collection('products')
          .doc(productId)
          .update({field: data}).catchError((error) {
        throw Exception('Failed to update product data $error');
      });
    } catch (error) {
      //print(error);
      throw Exception('Failed to update product data $error');
    }
  }

  Future<void> updateListItem(
      {required String productId,
      required String brand,
      required String listFieldName,
      required int updateIndex,
      required Map<String, dynamic> updateData}) async {
    final docRef = _firestore
        .collection("factories")
        .doc(brand)
        .collection('products')
        .doc(productId);

    DocumentSnapshot docSnapshot = await docRef.get();
    Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
    List<dynamic> items = data[listFieldName];

    if (updateIndex >= 0 && updateIndex < items.length) {
      items[updateIndex] = updateData;
    } else {
      print('Invalid update index.');
    }

    data[listFieldName] = items;
    await docRef.set(data);

    print('Document updated with modified list.');
  }

  Future deleteProduct(String brand, String id) async {
    try {
      await _firestore
          .collection("factories")
          .doc(brand)
          .collection('products')
          .doc(id)
          .delete()
          .catchError((error) {
        throw Exception('Failed to delete product data $error');
      });
    } catch (error) {
      throw Exception('Failed to delete product data $error');
    }
  }

  Future deleteBrand(String brandName) async {
    try {
      final snapshot = await _firestore
          .collection("factories")
          .doc(brandName.trim().toUpperCase())
          .collection('products')
          .get();
      snapshot.docs.map((doc) => deleteProduct(brandName, doc.id));
      await _firestore.collection("factories").doc(brandName).delete();
    } catch (error) {
      throw Exception('Failed to delete brand data $error');
    }
  }
  /* Future deleteHistoryItem(String userID, List data) async {
    try {
      await _firestore.collection("users").doc(userID).set(
          {"history": data}).then((value) => debug//print("delete history item"));
    } catch (error) {
      throw Exception("Faild to delete history item");
    }
  } */
}
