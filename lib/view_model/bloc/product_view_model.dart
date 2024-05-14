import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/product_models/product_details_model.dart';
import 'package:shop_app/services/api/dio.dart';

import '../../model/reviews/reviews.dart';
import 'app_states.dart';

class ProductViewModel extends Cubit<AppStates> {
  ProductViewModel() : super(InitialState());

  static ProductViewModel get(context) => BlocProvider.of(context);
  ProductModel? product;
  ReviewsModel? reviews;
  List<ProductModel> products = [];

  Future getProduct(
      int productId, String goodsSn, String productRelationID) async {
    emit(LoadingState());
    await APIService.getProductById(productId).then((value) {
      product = ProductModel.fromJson(APIService.productData);
    });
    await APIService.getReviewsOfProduct(productId, goodsSn, productRelationID)
        .then((value) {
      reviews = ReviewsModel.fromJson(APIService.reviews);
    });

    emit(CompleteState());
    return product;
  }
}
