import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/stock_section_bloc/stock_section_states.dart';

import '../../../model/admin_models/in_storage.dart';

class StockSectionBloc extends Cubit<StockSectionStates> {
  StockSectionBloc() : super(InStockInitialState());
  List<ProductInStock> productsInStock = [];
  void addProductInStock(int index, ProductInStock product) {
    if (index <= productsInStock.length - 1) {
      productsInStock[index] = product;
    } else {
      productsInStock.insert(index, product);
    }
    emit(AddProductInStockState());
  }

  int getProductquantity() {
    int quantity = 0;
    for (int i = 0; i < productsInStock.length; i++) {
      quantity += productsInStock[i].quantity!;
    }
    return quantity;
  }
}
