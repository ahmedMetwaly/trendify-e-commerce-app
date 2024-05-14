import '../product_models/brand_models.dart';
import '../product_models/retail_price.dart';

class SectionProductsModel {
  /* String? code;
  String? msg;
  Info? info; */
  List<Products>? item;

  SectionProductsModel({ this.item});

  SectionProductsModel.fromJson(Map<String, dynamic> json) {
 
    if (json["info"]['products'] != null) {
      item = <Products>[];
      json["info"]['products'].forEach((v) {
        item!.add(Products.fromJson(v));
      });
    }
  }

}


class Products {
  bool? soldOutStatus;
  String? goodsId;
  String? goodsSn;
  String? productRelationID;
  String? goodsImg;
  String? goodsImgWebp;
  List<String>? detailImage;
  String? goodsName;
  String? goodsUrlName;
  String? catId;
  String? cateName;
  String? stock;
  String? storeCode;
  String? businessModel;
  String? mallCode;
  int? isOnSale;
  RetailPrice? retailPrice;
  RetailPrice? salePrice;
  RetailPrice? discountPrice;
  String? unitDiscount;
  String? originalDiscount;
  PremiumFlag? premiumFlag;
  String? quickship;
  String? brandBadge;
  SeriesBadge? seriesBadge;
  String? isClearance;
  String? isShowPlusSize;
  String? commentNumShow;
  String? commentRankAverage;
  int? commentNum;
  String? goodsThumb;
  String? usePositionInfo;
  String? isTestingPic;
  String? dynamicAndRequestExtTrackInfo;

  Products(
      {this.soldOutStatus,
      this.goodsId,
      this.goodsSn,
      this.productRelationID,
      this.goodsImg,
      this.goodsImgWebp,
      this.detailImage,
      this.goodsName,
      this.goodsUrlName,
      this.catId,
      this.cateName,
      this.stock,
      this.storeCode,
      this.businessModel,
      this.mallCode,
      this.isOnSale,
      this.retailPrice,
      this.salePrice,
      this.discountPrice,
      this.unitDiscount,
      this.originalDiscount,
      this.premiumFlag,
      this.quickship,
      this.brandBadge,
      this.seriesBadge,
      this.isClearance,
      this.isShowPlusSize,
      this.commentNumShow,
      this.commentRankAverage,
      this.commentNum,
      this.goodsThumb,
      this.usePositionInfo,
      this.isTestingPic,
      this.dynamicAndRequestExtTrackInfo});

  Products.fromJson(Map<String, dynamic> json) {
    soldOutStatus = json['soldOutStatus'];
    goodsId = json['goods_id'];
    goodsSn = json['goods_sn'];
    productRelationID = json['productRelationID'];
    goodsImg = json['goods_img'];
    goodsImgWebp = json['goods_img_webp'];
    detailImage = json['detail_image'].cast<String>();
    goodsName = json['goods_name'];
    goodsUrlName = json['goods_url_name'];
    catId = json['cat_id'];
    cateName = json['cate_name'];
    stock = json['stock'];
    storeCode = json['store_code'];
    businessModel = json['business_model'];
    mallCode = json['mall_code'];
    isOnSale = json['is_on_sale'];
    retailPrice = json['retailPrice'] != null
        ? RetailPrice.fromJson(json['retailPrice'])
        : null;
    salePrice = json['salePrice'] != null
        ? RetailPrice.fromJson(json['salePrice'])
        : null;
    discountPrice = json['discountPrice'] != null
        ? RetailPrice.fromJson(json['discountPrice'])
        : null;
    unitDiscount = json['unit_discount'];
    originalDiscount = json['original_discount'];

    premiumFlag = json['premiumFlag'] != null
        ? PremiumFlag.fromJson(json['premiumFlag'])
        : null;
    quickship = json['quickship'];

    brandBadge = json['brand_badge'];
    seriesBadge = json['series_badge'] != null
        ? SeriesBadge.fromJson(json['series_badge'])
        : null;

    isClearance = json['is_clearance'];
    isShowPlusSize = json['is_show_plus_size'];
    commentNumShow = json['comment_num_show'];
    commentRankAverage = json['comment_rank_average'];
    commentNum = json['comment_num'];
 
    goodsThumb = json['goods_thumb'];

    isTestingPic = json['is_testing_pic'];
    dynamicAndRequestExtTrackInfo = json['dynamicAndRequestExtTrackInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['soldOutStatus'] = soldOutStatus;
    data['goods_id'] = goodsId;
    data['goods_sn'] = goodsSn;
    data['productRelationID'] = productRelationID;
    data['goods_img'] = goodsImg;
    data['goods_img_webp'] = goodsImgWebp;
    data['detail_image'] = detailImage;
    data['goods_name'] = goodsName;
    data['goods_url_name'] = goodsUrlName;
    data['cat_id'] = catId;
    data['cate_name'] = cateName;
    data['stock'] = stock;
    data['store_code'] = storeCode;
    data['business_model'] = businessModel;
    data['mall_code'] = mallCode;
    data['is_on_sale'] = isOnSale;
    if (retailPrice != null) {
      data['retailPrice'] = retailPrice!.toJson();
    }
    if (salePrice != null) {
      data['salePrice'] = salePrice!.toJson();
    }
    if (discountPrice != null) {
      data['discountPrice'] = discountPrice!.toJson();
    }
    data['unit_discount'] = unitDiscount;
    data['original_discount'] = originalDiscount;

    if (premiumFlag != null) {
      data['premiumFlag'] = premiumFlag!.toJson();
    }

    data['quickship'] = quickship;

    data['brand_badge'] = brandBadge;
    if (seriesBadge != null) {
      data['series_badge'] = seriesBadge!.toJson();
    }

    data['is_clearance'] = isClearance;

    data['is_show_plus_size'] = isShowPlusSize;

    data['comment_num_show'] = commentNumShow;
    data['comment_rank_average'] = commentRankAverage;
    data['comment_num'] = commentNum;
 
    data['goods_thumb'] = goodsThumb;

    data['usePositionInfo'] = usePositionInfo;
    data['is_testing_pic'] = isTestingPic;
    data['dynamicAndRequestExtTrackInfo'] = dynamicAndRequestExtTrackInfo;
    return data;
  }
}
