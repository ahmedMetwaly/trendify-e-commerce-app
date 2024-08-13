import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/bloc/admin/category_bloc/category_states.dart';

import '../../../generated/l10n.dart';

class CategoryBloc extends Cubit<CategoryStates> {
  CategoryBloc() : super(CategoryStateInitial());
  List<String> sectionOptions = [
    S.current.tShirts,
    S.current.oversizedTshirts,
    S.current.longSleeveTshirts,
    S.current.hoodies,
    S.current.sweatshirts,
    S.current.oversizedHoodies,
  ];
  String? sectionOption;

  List<String> genderOptions = [
    S.current.male,
    S.current.female,
    S.current.uniSex
  ];
  String? gender;
  String? imageFromNetwork;
  File? updatedImage;
  XFile? uploadedImage;

  String? deletedImage;
  void changeSectionOption(String? newValue) {
    sectionOption = newValue;
    emit(CategoryStateChangeSectionOption());
  }

  void changeGenderOption(String? newValue) {
    gender = newValue;
    emit(CategoryStateChangeSectionOption());
  }

  void addNewSection(String section) {
    sectionOptions.add(section);
    emit(AddNewSection());
  }

  Future pickCategoryImage(ImageSource imageSource) async {
    print("work");
    final ImagePicker picker = ImagePicker();
    XFile? selectedImage = await picker.pickImage(source: imageSource);
    if (selectedImage != null) {
      updatedImage = File(selectedImage.path);
      uploadedImage = selectedImage;
      print("category selected $uploadedImage");
      
      emit(CategoryImageLoaded());
    }
  }

  void deleteSizeImage() {
/*     image = null;
 */
    print(imageFromNetwork);
    imageFromNetwork = null;
    deletedImage = imageFromNetwork ?? "";
    updatedImage = null;
    print(imageFromNetwork);
    emit(CategoryImageDeleted());
  }
}
