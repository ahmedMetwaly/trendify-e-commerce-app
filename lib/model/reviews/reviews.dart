
import 'comments_overview_model.dart';
import 'product_coments_model.dart';

class ReviewsModel {
  String? shopRank;
  String? storeRatingSource;
  String? ratingRulesUrl;
  String? reviewSizeFitState;
  String? goodsId;
  CommentsOverview? commentsOverview;
  List<ProductComments>? productComments;

  ReviewsModel({
    this.shopRank,
    this.storeRatingSource,
    this.ratingRulesUrl,
    this.reviewSizeFitState,
    this.goodsId,
    this.commentsOverview,
    this.productComments,
  });

  ReviewsModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> info = json["info"] ?? {};
    shopRank = info['shopRank'];
    storeRatingSource = info['storeRatingSource'];
    ratingRulesUrl = info['ratingRulesUrl'];
    reviewSizeFitState = info['reviewSizeFitState'];
    goodsId = info['goods_id'];
    commentsOverview = info['comments_overview'] != null
        ? CommentsOverview.fromJson(info['comments_overview'])
        : null;

    if (info['product_comments'] != null) {
      productComments = <ProductComments>[];
      info['product_comments'].forEach((v) {
        productComments!.add(ProductComments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['shopRank'] = shopRank;
    data['storeRatingSource'] = storeRatingSource;
    data['ratingRulesUrl'] = ratingRulesUrl;
    data['reviewSizeFitState'] = reviewSizeFitState;
    data['goods_id'] = goodsId;
    if (commentsOverview != null) {
      data['comments_overview'] = commentsOverview!.toJson();
    }

    if (productComments != null) {
      data['product_comments'] =
          productComments!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
