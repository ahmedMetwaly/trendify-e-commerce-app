import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/bloc/admin/add_product_bloc/add_product_states.dart';
import 'package:shop_app/model/admin_models/product.dart';
import 'package:shop_app/services/firebase/admin_service.dart';

class AddProductBloc extends Cubit<AddProductStates> {
  AddProductBloc() : super(AddProductInitial());
  File? image;
  XFile? _mainImage;
  XFile? sizeImage;

  late Product product;
  Future pickMainImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    XFile? selectedImage = await picker.pickImage(source: imageSource);
    if (selectedImage != null) {
      image = File(selectedImage.path);
      _mainImage = selectedImage;
      print("image path = ${image!.path}");
      emit(MainImageLoaded());
    }
  }

  void deleteMainImage() {
    image = null;
    emit(MainImageDeleted());
  }

  void checkValidators(List<String> availableSizes) {
    if (availableSizes.isEmpty) {
      emit(CheckValidatorState(isValid: false));
    } else {
      emit(CheckValidatorState(isValid: true));
    }
  }

  Future setProductData({required Product product}) async {
    try {
      emit(AddProductLoading());
      await AdminFirestoreService().addProduct(product).then((productId) async {
        await AdminFirestoreService().updateProductField(
            productId: productId,
            field: "id",
            data: productId,
            brand: product.brand!.trim().toUpperCase());
        await AdminFirestoreService().uploadImage(
            brand: product.brand!.trim().toUpperCase(),
            productId: productId,
            field: "mainImage",
            image: File(_mainImage!.path));
        if (sizeImage != null) {
          await AdminFirestoreService().uploadImage(
              brand: product.brand!.trim().toUpperCase(),
              productId: productId,
              field: "sizeImage",
              image: File(sizeImage!.path));
        }
        if (product.category!.imageFile != null) {
          await AdminFirestoreService()
              .uploadImage(
                  brand: product.brand!.trim().toUpperCase(),
                  productId: productId,
                  image:File(product.category!.imageFile!.path),
                  field: "")
              .then((url) async {
            product.category!.imageUrl = url;
            await AdminFirestoreService().updateProductField(
                productId: productId,
                brand: product.brand!,
                data: product.category!.toJson(),
                field: "category");
          });
        }
        for (int i = 0; i < product.colors!.length; i++) {
          if (product.colors![i].imagesfile != null &&
              product.colors![i].imagesfile!.isNotEmpty) {
            await AdminFirestoreService()
                .uploadImages(
                    index: i,
                    productId: productId,
                    colorCode: product.colors![i].colorCode!,
                    images: product.colors![i].imagesfile!)
                .then((imagesUrl) async {
              product.colors![i].imagesUrl = imagesUrl;
              await AdminFirestoreService().updateListItem(
                  productId: productId,
                  updateIndex: i,
                  listFieldName: "colors",
                  updateData: product.colors![i].toJson(),
                  brand: product.brand!.trim().toUpperCase());
            });
          } else {
            product.colors![i].imagesUrl = [];
            await AdminFirestoreService().updateListItem(
                productId: productId,
                updateIndex: i,
                listFieldName: "colors",
                updateData: product.colors![i].toJson(),
                brand: product.brand!.trim().toUpperCase());
          }
        }
        print(productId);
      });
      emit(AddProductSuccess());
    } catch (error) {
      emit(AddProductError(error.toString()));
    }
  }
}
