import 'dart:io';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'color_state.dart';

class AddColor extends Cubit<ColorStates> {
  AddColor() : super(ColorsInitial());

  List<TextEditingController> colorsCode = [
    TextEditingController(text: ColorTools.colorCode(Colors.red))
  ];
  List<TextEditingController> colorsName = [
    TextEditingController(text: ColorTools.nameThatColor(Colors.red))
  ];
  List<List<File>> images = [[]];
  List<List<String>> imagesFromNetwork = [[]];
  List<String> deletedImages = [];

  void addNewColor() {
    colorsCode
        .add(TextEditingController(text: ColorTools.colorCode(Colors.red)));
    colorsName
        .add(TextEditingController(text: ColorTools.nameThatColor(Colors.red)));
    images.add([]);
    imagesFromNetwork.add([]);

    emit(ColorAdded());
  }

  void changeCurrentColor(int index, Color dialogPickerColor) {
    colorsCode[index].text = ColorTools.colorCode(dialogPickerColor);
    colorsName[index].text = ColorTools.nameThatColor(dialogPickerColor);
    emit(ColorChanged());
  }

  void deleteColor({required int index, required bool fromNetwork}) {
    colorsCode.removeAt(index);
    colorsName.removeAt(index);
    if (fromNetwork) {
      deletedImages.addAll(imagesFromNetwork[index]);
      imagesFromNetwork.removeAt(index);
    } else {
      images.removeAt(index);
    }

    emit(DeleteColor());
  }

//Images
  Future pickImages(int index) async {
    final ImagePicker picker = ImagePicker();
    List<File>? files = [];
    List<XFile?> selectedImages = await picker.pickMultiImage();
    files = List.generate(
        selectedImages.length, (index) => File(selectedImages[index]!.path));
    images[index] = files;
    print("images length = ${images.length}");

    emit(ImageSelected());
  }

  Future addImages(
      {required String productId,
      required bool fromNetwork,
      required int indexOfImages}) async {
    emit(ImagesLoading(indexOfImages: indexOfImages));
    final ImagePicker picker = ImagePicker();
    List<File>? files = [];
    List<XFile?> selectedImages = await picker.pickMultiImage();
    files = List.generate(
        selectedImages.length, (index) => File(selectedImages[index]!.path));
    /*  if (fromNetwork == true) {
      await AdminFirestoreService()
          .uploadImages(
              index: indexOfImages,
              productId: productId,
              colorCode: colorsCode[indexOfImages].text,
              images: files)
          .then((imagesUrl) async {
        imagesFromNetwork[indexOfImages].addAll(imagesUrl);
        /* await AdminFirestoreService().updateListItem(
                productId: productId,
                updateIndex: i,
                listFieldName: "colors",
                updateData: product.colors![i].toJson(),
                brand: product.brand!.trim().toUpperCase()); */
      });
      //imagesFromNetwork[indexOfImages].addAll(files);
    } else {
      images[indexOfImages].addAll(files);
    } */
    images[indexOfImages].addAll(files);
    print("images length = ${images.length}");

    emit(ImageSelected());
  }

  void setTheMainColorImage(File image) {
    images[0].add(image);
    emit(ImageSelected());
  }

  void deleteImage(
      {required int indexOfImages,
      required int index,
      required bool fromNetwork}) {
    if (fromNetwork == true) {
      deletedImages.add(imagesFromNetwork[indexOfImages][index]);
      imagesFromNetwork[indexOfImages].removeAt(index);
    } else {
      images[indexOfImages].removeAt(index);
    }
    emit(ImageDeleted());
  }
  /* void deleteImage(int index) {
    if (files != null && files!.isNotEmpty) {
      files!.removeAt(index);
    }
    emit(DeleteImage());
  } */
}
