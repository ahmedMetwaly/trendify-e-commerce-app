import 'all_color_details.dart';
import 'brand_models.dart';
import 'main_sale_attr.dart';
import 'material_details_model.dart';
import 'models_Info.dart';
import 'multi_level_sale.dart';
import 'poduct_description_model.dart';
import 'related_color_product_model.dart';
import 'retail_price.dart';

class ProductModel {
  String? code;
  String? msg;
  Info? info;

  ProductModel({code, msg, info});

  ProductModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['code'] = code;
    data['msg'] = msg;
    if (info != null) {
      data['info'] = info!.toJson();
    }
    return data;
  }
}

class Info {
  String? isShowMall;
  String? selectedMallCode;
  String? isLocalShipping;
  String? cateIds;
  String? ruleType;
  String? storeCode;
  String? goodsCategoryType;
  AllColorDetailImages? detailImages;
  String? goodsId;
  String? goodsSn;
  String? goodsImg;
  String? colorImage;
  String? cateName;
  String? isSkuData;
  String? isBraRecommendSize;
  String? returnTitle;
  String? isSupportReturn;
  String? isOutExposedShippingTime;
  String? isOutExposedShippingThreshold;
  MultiLevelSaleAttribute? multiLevelSaleAttribute;
  String? goodsDesc;
  int? isClearance;
  String? supplierId;
  List<ProductDescriptionModel>? productDetails;
  List<MaterialDetailsModel>? materialDetails;
  String? productRelationID;
  String? originalImg;
  String? goodsName;
  String? catId;
  String? isOnSale;
  String? stock;
  RetailPrice? salePrice;
  RetailPrice? retailPrice;
  String? unitDiscount;
  String? isSubscription;
  MainSaleAttribute? mainSaleAttribute;
  ModelsInfo? modelsInfo;
  AttrSizeDict? attrSizeDict;
  String? isSupportThirdSizeGuide;
  List<RelatedColorGoods>? relatedColorGoods;
  String? brandBadge;
  String? brandCode;
  SeriesBadge? seriesBadge;
  PremiumFlag? premiumFlag;
  String? videoUrl;
  int? isBeauty;
  SizeTemplate? sizeTemplate;
  String? isGirlShoesSize;

  List<SellingPoint>? sellingPoint;
  String? businessModel;
  String? isDisplayFeedbackTips;
  BrandDetailInfo? brandDetailInfo;

  Info(
      {isShowMall,
      selectedMallCode,
      isLocalShipping,
      cateIds,
      ruleType,
      storeCode,
      goodsCategoryType,
      goodsId,
      goodsSn,
      goodsImg,
      colorImage,
      cateName,
      isSkuData,
      isBraRecommendSize,
      returnTitle,
      isSupportReturn,
      isOutExposedShippingTime,
      isOutExposedShippingThreshold,
      multiLevelSaleAttribute,
      goodsDesc,
      isClearance,
      supplierId,
      productDetails,
      materialDetails,
      productRelationID,
      originalImg,
      goodsName,
      catId,
      isOnSale,
      stock,
      salePrice,
      retailPrice,
      unitDiscount,
      isSubscription,
      attrSizeTips,
      mainSaleAttribute,
      nowaterGallery,
      modelsInfo,
      attrSizeDict,
      isSupportThirdSizeGuide,
      relatedColorGoods,
      brandBadge,
      brandCode,
      seriesBadge,
      premiumFlag,
      videoUrl,
      isBeauty,
      sizeTemplate,
      isGirlShoesSize,
      sellingPoint,
      businessModel,
      isDisplayFeedbackTips,
      brandDetailInfo});
  Info.fromJson(Map<String, dynamic> json) {
    isShowMall = json['isShowMall'];
    selectedMallCode = json['selectedMallCode'];
    isLocalShipping = json['isLocalShipping'];
    cateIds = json['cateIds'];
    ruleType = json['ruleType'];
    storeCode = json['storeCode'];
    goodsCategoryType = json['goodsCategoryType'];
    detailImages = json["allColorDetailImages"] != null
        ? AllColorDetailImages.fromJson(json["allColorDetailImages"])
        : null;
    goodsId = json['goods_id'];
    goodsSn = json['goods_sn'];
    goodsImg = json['goods_img'];
    colorImage = json['color_image'];
    cateName = json['cate_name'];
    isSkuData = json['isSkuData'];
    isBraRecommendSize = json['isBraRecommendSize'];

    returnTitle = json['return_title'];
    isSupportReturn = json['is_support_return'];
    isOutExposedShippingTime = json['isOutExposedShippingTime'];
    isOutExposedShippingThreshold = json['isOutExposedShippingThreshold'];
    multiLevelSaleAttribute = json['multiLevelSaleAttribute'] != null
        ? MultiLevelSaleAttribute.fromJson(json['multiLevelSaleAttribute'])
        : null;
    goodsDesc = json['goods_desc'];
    isClearance = json['is_clearance'];
    supplierId = json['supplier_id'];
    if (json['productDetails'] != null) {
      productDetails = <ProductDescriptionModel>[];
      json['productDetails'].forEach((v) {
        productDetails!.add(ProductDescriptionModel.fromJson(v));
      });
    }
    if (json['materialDetails'] != null) {
      materialDetails = <MaterialDetailsModel>[];
      json['materialDetails'].forEach((v) {
        materialDetails!.add(MaterialDetailsModel.fromJson(v));
      });
    }
    productRelationID = json['productRelationID'];
    originalImg = json['original_img'];
    goodsName = json['goods_name'];
    catId = json['cat_id'];
    isOnSale = json['is_on_sale'];
    stock = json['stock'];
    salePrice = json['sale_price'] != null
        ? RetailPrice.fromJson(json['sale_price'])
        : null;
    retailPrice = json['retail_price'] != null
        ? RetailPrice.fromJson(json['retail_price'])
        : null;
    unitDiscount = json['unit_discount'];
    isSubscription = json['is_subscription'];

    mainSaleAttribute = json['mainSaleAttribute'] != null
        ? MainSaleAttribute.fromJson(json['mainSaleAttribute'])
        : null;

    modelsInfo = json['models_info'] != null
        ? ModelsInfo.fromJson(json['models_info'])
        : null;
    attrSizeDict = json['attrSizeDict'] != null
        ? AttrSizeDict.fromJson(json['attrSizeDict'])
        : null;
    isSupportThirdSizeGuide = json['is_support_third_size_guide'];

    if (json['related_color_goods'] != null) {
      relatedColorGoods = <RelatedColorGoods>[];
      json['related_color_goods'].forEach((v) {
        relatedColorGoods!.add(RelatedColorGoods.fromJson(v));
      });
    }
    brandBadge = json['brand_badge'];
    brandCode = json['brand_code'];
    seriesBadge = json['series_badge'] != null
        ? SeriesBadge.fromJson(json['series_badge'])
        : null;
    premiumFlag = json['premiumFlag'] != null
        ? PremiumFlag.fromJson(json['premiumFlag'])
        : null;
    videoUrl = json['video_url'];
    isBeauty = json['is_beauty'];
    sizeTemplate = json['sizeTemplate'] != null
        ? SizeTemplate.fromJson(json['sizeTemplate'])
        : null;
    isGirlShoesSize = json['isGirlShoesSize'];

    businessModel = json['business_model'];
    isDisplayFeedbackTips = json['isDisplayFeedbackTips'];
    brandDetailInfo = json['brandDetailInfo'] != null
        ? BrandDetailInfo.fromJson(json['brandDetailInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['isShowMall'] = isShowMall;
    data['selectedMallCode'] = selectedMallCode;

    data['isLocalShipping'] = isLocalShipping;

    data['cateIds'] = cateIds;
    data['ruleType'] = ruleType;
    data['storeCode'] = storeCode;

    data['goodsCategoryType'] = goodsCategoryType;

    data['goods_id'] = goodsId;
    data['goods_sn'] = goodsSn;
    data['goods_img'] = goodsImg;
    data['color_image'] = colorImage;
    data['cate_name'] = cateName;
    data['isSkuData'] = isSkuData;

    data['isBraRecommendSize'] = isBraRecommendSize;
    data['return_title'] = returnTitle;
    data['is_support_return'] = isSupportReturn;
    data['isOutExposedShippingTime'] = isOutExposedShippingTime;
    data['isOutExposedShippingThreshold'] = isOutExposedShippingThreshold;
    if (multiLevelSaleAttribute != null) {
      data['multiLevelSaleAttribute'] = multiLevelSaleAttribute!.toJson();
    }
    data['goods_desc'] = goodsDesc;
    data['is_clearance'] = isClearance;
    data['supplier_id'] = supplierId;
    if (productDetails != null) {
      data['productDetails'] = productDetails!.map((v) => v.toJson()).toList();
    }
    if (materialDetails != null) {
      data['materialDetails'] =
          materialDetails!.map((v) => v.toJson()).toList();
    }
    data['productRelationID'] = productRelationID;
    data['original_img'] = originalImg;
    data['goods_name'] = goodsName;
    data['cat_id'] = catId;
    data['is_on_sale'] = isOnSale;
    data['stock'] = stock;
    if (salePrice != null) {
      data['sale_price'] = salePrice!.toJson();
    }
    if (retailPrice != null) {
      data['retail_price'] = retailPrice!.toJson();
    }
    data['unit_discount'] = unitDiscount;
    data['is_subscription'] = isSubscription;

    if (mainSaleAttribute != null) {
      data['mainSaleAttribute'] = mainSaleAttribute!.toJson();
    }
    if (modelsInfo != null) {
      data['models_info'] = modelsInfo!.toJson();
    }
    if (attrSizeDict != null) {
      data['attrSizeDict'] = attrSizeDict!.toJson();
    }
    data['is_support_third_size_guide'] = isSupportThirdSizeGuide;

    if (relatedColorGoods != null) {
      data['related_color_goods'] =
          relatedColorGoods!.map((v) => v.toJson()).toList();
    }
    data['brand_badge'] = brandBadge;
    data['brand_code'] = brandCode;
    if (seriesBadge != null) {
      data['series_badge'] = seriesBadge!.toJson();
    }
    if (premiumFlag != null) {
      data['premiumFlag'] = premiumFlag!.toJson();
    }
    data['video_url'] = videoUrl;
    data['is_beauty'] = isBeauty;
    if (sizeTemplate != null) {
      data['sizeTemplate'] = sizeTemplate!.toJson();
    }
    data['isGirlShoesSize'] = isGirlShoesSize;

    data['business_model'] = businessModel;
    data['isDisplayFeedbackTips'] = isDisplayFeedbackTips;
    if (brandDetailInfo != null) {
      data['brandDetailInfo'] = brandDetailInfo!.toJson();
    }
    return data;
  }
}
