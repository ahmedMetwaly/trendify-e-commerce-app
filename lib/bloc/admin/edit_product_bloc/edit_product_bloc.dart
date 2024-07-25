import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/bloc/admin/edit_product_bloc/edit_product_states.dart';
import 'package:shop_app/services/firebase/admin_service.dart';

import '../../../model/admin_models/product.dart';

class EditProductBloc extends Cubit<EditProductStates> {
  EditProductBloc() : super(EditProductInitialState());
  String? imageFromNetwork;
  File? updatedImage;
  XFile? _uploadedImage;
  String? deletedImage;

  XFile? sizeImage;
  List<String> deletedImages = [];
  late Product product;
  Future pickMainImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    XFile? selectedImage = await picker.pickImage(source: imageSource);
    if (selectedImage != null) {
      updatedImage = File(selectedImage.path);
      _uploadedImage = selectedImage;
      print("image path = ${updatedImage!.path}");
      emit(MainImageLoaded());
    }
  }

  void deleteMainImage() {
    print(imageFromNetwork);
    imageFromNetwork = null;
    deletedImage = imageFromNetwork ?? "";
    updatedImage = null;
    print(imageFromNetwork);
    emit(ImageDeleted());
  }

  Future saveProduct({required Product product}) async {
    emit(EditProductLoadingState());
    try {
      await AdminFirestoreService().updateProduct(product);
      print("product");
      if (product.mainImage != imageFromNetwork) {
        await AdminFirestoreService().deleteImage(product.mainImage!);
        print("deleted main image ${product.mainImage}");
        await AdminFirestoreService().uploadImage(
            brand: product.brand!.trim().toUpperCase(),
            productId: product.id!,
            image: _uploadedImage!,
            field: "mainImage");
      }
   
      if (sizeImage != null) {
        await AdminFirestoreService().deleteImage(product.sizeImage!);
        print("deleted size image ${product.sizeImage}");
        await AdminFirestoreService().uploadImage(
            brand: product.brand!.trim().toUpperCase(),
            productId: product.id!,
            field: "sizeImage",
            image: sizeImage!);
        print("uploaded size image ");
      }
      for (int i = 0; i < product.colors!.length; i++) {
        if (product.colors![i].imagesfile != null &&
            product.colors![i].imagesfile!.isNotEmpty) {
          await AdminFirestoreService()
              .uploadImages(
                  index: i,
                  productId: product.id!,
                  colorCode: product.colors![i].colorCode!,
                  images: product.colors![i].imagesfile!)
              .then((imagesUrl) async {
            product.colors![i].imagesUrl?.addAll(imagesUrl);
            await AdminFirestoreService().updateListItem(
                productId: product.id!,
                updateIndex: i,
                listFieldName: "colors",
                updateData: product.colors![i].toJson(),
                brand: product.brand!.trim().toUpperCase());
          });
        } else {
          product.colors?[i].imagesUrl?.map((imageUrl) {
            if (deletedImages.contains(imageUrl)) {
              product.colors?[i].imagesUrl?.remove(imageUrl);
            }
          });
          await AdminFirestoreService().updateListItem(
              productId: product.id!,
              updateIndex: i,
              listFieldName: "colors",
              updateData: product.colors![i].toJson(),
              brand: product.brand!.trim().toUpperCase());
        }
      }
     

      emit(EditProductSuccessState());
    } catch (error) {
      emit(EditProductFailedState(errorMessage: error.toString()));
    }
  }
}
