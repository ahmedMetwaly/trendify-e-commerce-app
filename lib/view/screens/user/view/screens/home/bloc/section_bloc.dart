import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/view/screens/user/view/screens/home/bloc/section_states.dart';
import 'package:shop_app/view/screens/user/view/screens/home/home_repos/section_repo.dart';

import '../../../../../../../model/admin_models/product.dart';
import '../../../../../../components/check_label.dart';

class SectionBloc extends Cubit<SectionStates> {
  SectionBloc() : super(InitialSectionState());
  List<Product> products = [];
  List<Product> newProducts = [];
  List<Product> onSaleProducts = [];
  Future getProducts() async {
    try {
      emit(LoadingSectionState());
      await SectionRepo().getProducts().then((value) {
        products = value;
        print(products);
        for(Product product in products){
          if (daysBetween(product.puplishedDate ?? "") < 7) {
            newProducts.add(product);
          }
          if (double.parse(product.salePrecentage!) > 0) {
            onSaleProducts.add(product);
          }
        }
        emit(SuccessSectionState(products: products));
      });
    } catch (error) {
      emit(ErrorSectionState(error: error.toString()));
    }
  }

  //TODO:: seperate new , on sale
  void getOnSaleProducts() {}
  void getNewProducts() {
    products.map((product) {
      if (daysBetween(product.puplishedDate ?? "") < 3) {}
    });
  }
}
