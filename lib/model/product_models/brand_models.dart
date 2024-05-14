class SeriesBadge {
  String? name;
  String? imageUrl;
  String? cornerImgRight;
  String? cornerImgLeft;

  SeriesBadge({name, imageUrl, cornerImgRight, cornerImgLeft});

  SeriesBadge.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['image_url'];
    cornerImgRight = json['corner_img_right'];
    cornerImgLeft = json['corner_img_left'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['image_url'] = imageUrl;
    data['corner_img_right'] = cornerImgRight;
    data['corner_img_left'] = cornerImgLeft;
    return data;
  }
}

class PremiumFlag {
  String? brandId;
  int? productRecommendByGroup;
  String? secondSeriesId;
  String? brandBadgeName;
  String? brandCode;
  String? seriesBadgeName;
  String? seriesLogoUrlLeft;
  String? seriesLogoUrlRight;
  String? seriesId;




  PremiumFlag(
      {brandId,
      productRecommendByGroup,
      secondSeriesId,
      brandBadgeName,
      brandCode,
      seriesBadgeName,
      seriesLogoUrlLeft,
      seriesLogoUrlRight,
      seriesId});

  PremiumFlag.fromJson(Map<String, dynamic> json) {
    brandId = json['brandId'];
    productRecommendByGroup = json['productRecommendByGroup'];
    secondSeriesId = json['secondSeriesId'];
    brandBadgeName = json['brand_badge_name'];
    brandCode = json['brand_code'];
    seriesBadgeName = json['series_badge_name'];
    seriesLogoUrlLeft = json['series_logo_url_left'];
    seriesLogoUrlRight = json['series_logo_url_right'];
    seriesId = json['seriesId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['brandId'] = brandId;
    data['productRecommendByGroup'] = productRecommendByGroup;
    data['secondSeriesId'] = secondSeriesId;
    data['brand_badge_name'] = brandBadgeName;
    data['brand_code'] = brandCode;
    data['series_badge_name'] = seriesBadgeName;
    data['series_logo_url_left'] = seriesLogoUrlLeft;
    data['series_logo_url_right'] = seriesLogoUrlRight;
    data['seriesId'] = seriesId;
    return data;
  }
}

class SizeTemplate {
  String? imageUrl;
  List<DescriptionMulti>? descriptionMulti;

  SizeTemplate({imageUrl, descriptionMulti});

  SizeTemplate.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    if (json['description_multi'] != null) {
      descriptionMulti = <DescriptionMulti>[];
      json['description_multi'].forEach((v) {
        descriptionMulti!.add(DescriptionMulti.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['image_url'] = imageUrl;
    if (descriptionMulti != null) {
      data['description_multi'] =
          descriptionMulti!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DescriptionMulti {
  String? name;
  String? description;
  int? sort;

  DescriptionMulti({name, description, sort});

  DescriptionMulti.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['description'] = description;
    data['sort'] = sort;
    return data;
  }
}


class SellingPoint {
  String? tagId;
  String? tagNameEn;
  String? tagName;
  String? tagValId;
  String? tagValName;
  String? tagValDesc;
  String? tagValNameEn;
  String? tagValNameLang;
  String? change;
  String? tagTextColor;
  String? tagBgColor;
  String? tagSort;

  SellingPoint(
      {tagId,
      tagNameEn,
      tagName,
      tagValId,
      tagValName,
      tagValDesc,
      tagValNameEn,
      tagValNameLang,
      change,
      tagTextColor,
      tagBgColor,
      tagSort});

  SellingPoint.fromJson(Map<String, dynamic> json) {
    tagId = json['tag_id'];
    tagNameEn = json['tag_name_en'];
    tagName = json['tag_name'];
    tagValId = json['tag_val_id'];
    tagValName = json['tag_val_name'];
    tagValDesc = json['tag_val_desc'];
    tagValNameEn = json['tag_val_name_en'];
    tagValNameLang = json['tag_val_name_lang'];
    change = json['change'];
    tagTextColor = json['tag_text_color'];
    tagBgColor = json['tag_bg_color'];
    tagSort = json['tag_sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['tag_id'] = tagId;
    data['tag_name_en'] = tagNameEn;
    data['tag_name'] = tagName;
    data['tag_val_id'] = tagValId;
    data['tag_val_name'] = tagValName;
    data['tag_val_desc'] = tagValDesc;
    data['tag_val_name_en'] = tagValNameEn;
    data['tag_val_name_lang'] = tagValNameLang;
    data['change'] = change;
    data['tag_text_color'] = tagTextColor;
    data['tag_bg_color'] = tagBgColor;
    data['tag_sort'] = tagSort;
    return data;
  }
}

class BrandDetailInfo {
  String? brandLabelTips;
  String? authenticBrand;
  String? goodsId;
  String? brandCode;
  String? name;
  String? brandLogo;
  String? brandType;
  List<String>? brandShowArr;
  String? brandIntroduction;
  BrandSelectInfo? brandSelectInfo;

  BrandDetailInfo(
      {brandLabelTips,
      authenticBrand,
      goodsId,
      brandCode,
      name,
      brandLogo,
      brandType,
      brandShowArr,
      brandIntroduction,
      brandSelectInfo});

  BrandDetailInfo.fromJson(Map<String, dynamic> json) {
    brandLabelTips = json['brandLabelTips'];
    authenticBrand = json['authenticBrand'];
    goodsId = json['goodsId'];
    brandCode = json['brand_code'];
    name = json['name'];
    brandLogo = json['brand_logo'];
    brandType = json['brand_type'];
    brandShowArr = json['brand_show_arr'].cast<String>();
    brandIntroduction = json['brand_introduction'];
    brandSelectInfo = json['brand_select_info'] != null
        ? BrandSelectInfo.fromJson(json['brand_select_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['brandLabelTips'] = brandLabelTips;
    data['authenticBrand'] = authenticBrand;
    data['goodsId'] = goodsId;
    data['brand_code'] = brandCode;
    data['name'] = name;
    data['brand_logo'] = brandLogo;
    data['brand_type'] = brandType;
    data['brand_show_arr'] = brandShowArr;
    data['brand_introduction'] = brandIntroduction;
    if (brandSelectInfo != null) {
      data['brand_select_info'] = brandSelectInfo!.toJson();
    }
    return data;
  }
}

class BrandSelectInfo {
  String? selectName;
  String? scUrlId;
  String? selectTypeId;
  String? selectTypeName;
  String? description;
  String? scUrl;
  String? mainSite;
  String? brandCode;

  BrandSelectInfo(
      {selectName,
      scUrlId,
      selectTypeId,
      selectTypeName,
      description,
      scUrl,
      mainSite,
      brandCode});

  BrandSelectInfo.fromJson(Map<String, dynamic> json) {
    selectName = json['select_name'];
    scUrlId = json['sc_url_id'];
    selectTypeId = json['select_type_id'];
    selectTypeName = json['select_type_name'];
    description = json['description'];
    scUrl = json['sc_url'];
    mainSite = json['main_site'];
    brandCode = json['brand_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['select_name'] = selectName;
    data['sc_url_id'] = scUrlId;
    data['select_type_id'] = selectTypeId;
    data['select_type_name'] = selectTypeName;
    data['description'] = description;
    data['sc_url'] = scUrl;
    data['main_site'] = mainSite;
    data['brand_code'] = brandCode;
    return data;
  }
}
