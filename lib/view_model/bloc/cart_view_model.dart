// cart_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/view_model/bloc/app_states.dart';

// BLoC
class CartBloc extends Cubit<AppStates> {
  CartBloc() : super(InitialState());
  static CartBloc get(context) => BlocProvider.of(context);
  List<Map> products = [];
  void addProduct(int productId, String sn, String sku) {
    // add to firebase
    products.add({"id": productId, "sn": sn, "sku": sku});
    emit(AddProduct());
  }

  void deleteProduct(int productId) {
    // add to firebase
    products.removeWhere((element) => element["id"] == productId);
    emit(RemoveProduct());
  }
}
