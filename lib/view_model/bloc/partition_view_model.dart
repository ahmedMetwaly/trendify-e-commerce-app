import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/category_products/partition_products_model.dart';
import 'package:shop_app/services/api/dio.dart';
import 'package:shop_app/view_model/bloc/app_states.dart';

class SectionViewModel extends Cubit<AppStates> {
  SectionViewModel() : super(InitialState());

  static SectionViewModel get(context) => BlocProvider.of(context);
  SectionProductsModel? products;
  Future getSectionProducts(int partetionId) async {
    emit(LoadingState());
    await APIService.getPartitionProductsData(partetionId).then((value) =>
        products =
            SectionProductsModel.fromJson(APIService.partitionProducts));     
    emit(CompleteState());
  }
}
