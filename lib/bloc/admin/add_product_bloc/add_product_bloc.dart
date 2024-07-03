import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/bloc/admin/add_product_bloc/add_product_states.dart';

class AddProductBloc extends Cubit<AddProductStates> {
  AddProductBloc() : super(AddProductInitial());
  File? image;

  Future pickMainImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    XFile? selectedImage = await picker.pickImage(source: imageSource);
    if (selectedImage != null) {
      image = File(selectedImage.path);
      print("image path = ${image!.path}");
      emit(MainImageLoaded());
    }
  }
  void deleteMainImage(){
    image = null;
    emit(MainImageDeleted());
  }
}
