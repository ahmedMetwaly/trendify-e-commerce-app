import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/in_stock_bloc/in_stock_states.dart';

import '../../../model/in_storage.dart';

class InStockBloc extends Cubit<InStockStates> {
  InStockBloc() : super(InStockInitialState());
  List<ProductInStock> productsInStock = [];
  
  void addProductInStock(int index,ProductInStock product) {

    if(index<=productsInStock.length-1){
          productsInStock[index]= product;

    }else{
    productsInStock.insert(index, product);

    }
    emit(AddProductInStockState());
  }
}
