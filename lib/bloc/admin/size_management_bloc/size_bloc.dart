
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'size_state.dart';

class AddSize extends Cubit<SizeStates> {
  AddSize() : super(SizesInitial());

  Map<String, bool> sizes = {
    "One Size": false,
    "XS": false,
    "S": false,
    "M": false,
    "L": false,
    "XL": false,
    "XXL": false,
    "XXXL": false
  };
  List<String> availableSizes = [];

  void addNewSize(String size) {
    //  availableSizes.add();
    final newSize = <String, bool>{size: true};
    sizes.addEntries(newSize.entries);
    print(sizes);
    emit(AddNewSize());
  }

  void deleteSize(int index) {
    availableSizes.removeAt(index);
    emit(DeleteSize());
  }

  void addAvailableSize(int index, bool? value) {
    if (value == true) {
      sizes[sizes.keys.toList()[index]] = true;
      availableSizes.add(sizes.keys.toList()[index]);
    } else {
      sizes[sizes.keys.toList()[index]] = false;
      availableSizes.remove(sizes.keys.toList()[index]);
    }
    emit(SizeAdded());
  }

  XFile? image;

  Future pickSizeImage(ImageSource imageSource) async {
    print("work");
    final ImagePicker picker = ImagePicker();
    XFile? selectedImage = await picker.pickImage(source: imageSource);
    if (selectedImage != null) {
      image = selectedImage;
      emit(SizeImageLoaded());
    }
  }
  void deleteSizeImage(){
    image = null;
    emit(SizeImageDeleted());
  }
}
