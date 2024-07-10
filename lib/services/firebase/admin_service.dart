import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/model/product.dart';

class AdminFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> saveProductData(Product product) async {
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
/* 
  Future saveData(String factory , String model,Product product) async {
    try {
      //print("user id :${user.uid}");
      final factoryName =  _firestore.collection('factories').doc("0");
      await factoryName.set({"factoryName": factory});
      final model = factoryName.collection("0");
      await model.doc("0").set(product.toJson());
    } catch (error) {
      // debug//print('Error saving user data: $error');
      throw Exception("Error while saving data to the database $error");
    }
  } */

  Future getProductsData(String productId) async {
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
  }

  Future updataProductData(
      {required String productId,
      required String field,
      required dynamic data}) async {
    //print("userId $userId");

    try {
      await _firestore
          .collection("products")
          .doc(productId)
          .update({field: data}).catchError((error) {
        throw Exception('Failed to update product data');
      });
    } catch (error) {
      //print(error);
      throw Exception('Failed to update product data');
    }
  }

  Future<String> uploadImage(
      {required String productId, required XFile image, required field}) async {
    try {
      final storage = FirebaseStorage.instance;
      final imageName = '$productId.jpg';
      final reference =
          storage.ref().child('products_main_pictures/$imageName');
      final uploadTask = reference.putFile(File(image.path));
      final snapshot = await uploadTask.whenComplete(() => null);
      final url = await snapshot.ref.getDownloadURL();
      await updataProductData(productId: productId, field: field, data: url);
      return url.toString();
    } catch (error) {
      //print("error yad");
      throw Exception("Faild to Upload Image");
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
        final imageName = '$productId${i + 1}$colorCode.jpg';
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

  Future updateProductField(
      {required String productId,
      required String field,
      required dynamic data}) async {
    //print("userId $userId");

    try {
      await _firestore.collection("products").doc(productId).update({
        field:  data
      }).catchError((error) {
        throw Exception('Failed to update product data');
      });
    } catch (error) {
      //print(error);
      throw Exception('Failed to update product data');
    }
  }

  Future<void> updateListItem(
      {required String productId,
      required String listFieldName,
      required int updateIndex,
      required Map<String, dynamic> updateData}) async {
    final docRef = _firestore.collection("products").doc(productId);

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

  /* Future deleteHistoryItem(String userID, List data) async {
    try {
      await _firestore.collection("users").doc(userID).set(
          {"history": data}).then((value) => debug//print("delete history item"));
    } catch (error) {
      throw Exception("Faild to delete history item");
    }
  } */
}
