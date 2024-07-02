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
  void addNewColor() {
    colorsCode
        .add(TextEditingController(text: ColorTools.colorCode(Colors.red)));
    colorsName
        .add(TextEditingController(text: ColorTools.nameThatColor(Colors.red)));
    images.add([]);
    emit(ColorAdded());
  }

  void deleteColor(int index) {
    colorsCode.removeAt(index);
    colorsName.removeAt(index);
    images.removeAt(index);
    emit(DeleteColor());
  }

//Images
  Future pickImages() async {
    final ImagePicker picker = ImagePicker();
    List<File>? files = [];
    List<XFile?> selectedImages = await picker.pickMultiImage();

    files = List.generate(
        selectedImages.length, (index) => File(selectedImages[index]!.path));
    images.last = files;
    print("images length = ${images.length}");

    emit(ImageSelected());
  }

  Future addImages(int index) async {
    final ImagePicker picker = ImagePicker();
    List<File>? files = [];
    List<XFile?> selectedImages = await picker.pickMultiImage();

    files = List.generate(
        selectedImages.length, (index) => File(selectedImages[index]!.path));
    images[index].addAll(files);
    print("images length = ${images.length}");

    emit(ImageSelected());
  }

  void deleteImage(int indexOfImages, int index) {
    images[indexOfImages].removeAt(index);
    emit(ImageDeleted());
  }
  /* void deleteImage(int index) {
    if (files != null && files!.isNotEmpty) {
      files!.removeAt(index);
    }
    emit(DeleteImage());
  } */
}
