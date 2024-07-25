import 'package:shop_app/model/admin_models/brand_model.dart';

import '../../../model/admin_models/product.dart';

abstract class StockStates {}

class StockInitialState extends StockStates {}

class StockLoadingState extends StockStates {}

class BrandsGotSuccess extends StockStates {
  final List<BrandModel> brands;

  BrandsGotSuccess({required this.brands});
}

class ProductsGotSuccess extends StockStates {
  final List<Product> products;

  ProductsGotSuccess({required this.products});
}

class SearchSuccessed extends StockStates {
  final List<Product> products;

  SearchSuccessed({required this.products});
}
class StockFailedState extends StockStates {
  final String message;
  StockFailedState({required this.message});
}
class ProductDeletedSuccessfully extends StockStates{}
class BrandDeletedSuccessfully extends StockStates{}