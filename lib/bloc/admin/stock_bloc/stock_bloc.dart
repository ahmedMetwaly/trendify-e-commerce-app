import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/stock_bloc/stock_states.dart';
import 'package:shop_app/model/admin_models/brand_model.dart';
import 'package:shop_app/services/firebase/admin_service.dart';

import '../../../model/admin_models/product.dart';

class StockBloc extends Cubit<StockStates> {
  StockBloc() : super(StockInitialState());
  List<BrandModel> brands = [];
  List<Product> productsInSpecificBrand = [];

  void setInit() {
    emit(StockInitialState());
  }

  Future getBrands() async {
    emit(StockLoadingState());
    await AdminFirestoreService().getBrands().then((data) {
      brands = data;
      emit(BrandsGotSuccess(brands: data));
    }).catchError((error) {
      emit(StockFailedState(message: error.toString()));
    });
  }

  void search(String value) {
    emit(StockLoadingState());
    List<BrandModel> searchedBrands = brands
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase().trim()))
        .toList();
    emit(BrandsGotSuccess(brands: searchedBrands));
  }

  Future getBrandProducts(String brandName) async {
    emit(StockLoadingState());
    await AdminFirestoreService()
        .getProductsOfBrand(brandName)
        .then((products) {
      print(products);
      productsInSpecificBrand = products;
      emit(ProductsGotSuccess(products: products));
    }).catchError((error) {
      emit(StockFailedState(message: error.toString()));
    });
  }

  void searchProduct(String value, List<Product> products) {
    emit(StockLoadingState());
    List<Product> searchedProducts = products
        .where((element) =>
            element.title!.toLowerCase().contains(value.toLowerCase().trim()))
        .toList();
    emit(SearchSuccessed(products: searchedProducts));
  }

  Future deleteProduct({required Product product}) async {
    try {
      emit(StockLoadingState());
      await AdminFirestoreService().deleteProduct(product.brand!, product.id!);
      for (int i = 0; i < product.colors!.length; i++) {
        if (product.colors![i].imagesUrl!.isNotEmpty) {
          product.colors![i].imagesUrl!.map((imageUrl) async =>
              await AdminFirestoreService().deleteImage(imageUrl));
        }
      }
      await AdminFirestoreService().deleteImage(product.mainImage!);
      if (product.sizeImage != null) {
        await AdminFirestoreService().deleteImage(product.sizeImage!);
      }
      emit(ProductDeletedSuccessfully());
    } catch (error) {
      emit(StockFailedState(message: error.toString()));
    }
  }

  Future deleteBrand(String brandName) async {
    try {
      emit(StockLoadingState());
      await AdminFirestoreService().deleteBrand(brandName);
      await getBrands();
      emit(BrandDeletedSuccessfully());
    } catch (error) {
      emit(StockFailedState(message: error.toString()));
    }
  }
}
