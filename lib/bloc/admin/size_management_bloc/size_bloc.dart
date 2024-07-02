import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'size_state.dart';

class AddSize extends Cubit<SizeStates> {
  AddSize() : super(SizesInitial());

  List<String> availableSizes = [];
  List<TextEditingController> sizeDiscription = [TextEditingController()];

  void addNewSize(String availableSize){
    availableSizes.add(availableSize);
    sizeDiscription.add(TextEditingController());
    emit(SizeAdded());
  }
  void deleteSize(int index){
    availableSizes.removeAt(index);
    sizeDiscription.removeAt(index);
    emit(DeleteSize());
  }
}
