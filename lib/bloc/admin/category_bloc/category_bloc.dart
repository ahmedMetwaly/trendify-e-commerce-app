import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/category_bloc/category_states.dart';
import 'package:shop_app/model/category.dart';

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
  CategoryModel? categoryModel;
  void changeSectionOption(String? newValue) {
    sectionOption = newValue;
    categoryModel?.section = newValue!;
    emit(CategoryStateChangeSectionOption());
  }

  void changeGenderOption(String? newValue) {
    gender = newValue;
    categoryModel?.gender = newValue!;

    emit(CategoryStateChangeSectionOption());
  }

  void addNewSection(String section) {
    sectionOptions.add(section);
    emit(AddNewSection());
  }
}
