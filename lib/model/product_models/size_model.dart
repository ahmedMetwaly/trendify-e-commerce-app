
class SkcSaleAttr {
  String? isDisplayOneSize;
  String? attrId;
  String? attrName;
  String? isSize;
  List<AttrValueList>? attrValueList;
  String? isAttrHasRelatedDescInfo;
  List<AttrValueSizeCountry>? attrValueSizeCountry;

  SkcSaleAttr(
      {isDisplayOneSize,
      attrId,
      attrName,
      isSize,
      attrValueList,
      isAttrHasRelatedDescInfo,
      attrValueSizeCountry});

  SkcSaleAttr.fromJson(Map<String, dynamic> json) {
    isDisplayOneSize = json['isDisplayOneSize'];
    attrId = json['attr_id'];
    attrName = json['attr_name'];
    isSize = json['isSize'];
    if (json['attr_value_list'] != null) {
      attrValueList = <AttrValueList>[];
      json['attr_value_list'].forEach((v) {
        attrValueList!.add(AttrValueList.fromJson(v));
      });
    }
    isAttrHasRelatedDescInfo = json['isAttrHasRelatedDescInfo'];
    if (json['attr_value_size_country'] != null) {
      attrValueSizeCountry = <AttrValueSizeCountry>[];
      json['attr_value_size_country'].forEach((v) {
        attrValueSizeCountry!.add(AttrValueSizeCountry.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['isDisplayOneSize'] = isDisplayOneSize;
    data['attr_id'] = attrId;
    data['attr_name'] = attrName;
    data['isSize'] = isSize;
    if (attrValueList != null) {
      data['attr_value_list'] = attrValueList!.map((v) => v.toJson()).toList();
    }
    data['isAttrHasRelatedDescInfo'] = isAttrHasRelatedDescInfo;
    if (attrValueSizeCountry != null) {
      data['attr_value_size_country'] =
          attrValueSizeCountry!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttrValueList {
  String? attrValueId;
  String? attrValueName;
  String? attrValueNameEn;
  String? attrStdValue;
  List<AttrDescPopUp>? attrDescPopUp;
  String? attrLocalSizeValue;
  String? countryCode;
  List<AttrValueLocalSize>? attrValueLocalSize;
  String? sizeGatherTag;
  String? goodsId;

  AttrValueList(
      {attrValueId,
      attrValueName,
      attrValueNameEn,
      attrStdValue,
      attrDescPopUp,
      attrLocalSizeValue,
      countryCode,
      attrValueLocalSize,
      sizeGatherTag,
      goodsId});

  AttrValueList.fromJson(Map<String, dynamic> json) {
    attrValueId = json['attr_value_id'];
    attrValueName = json['attr_value_name'];
    attrValueNameEn = json['attr_value_name_en'];
    attrStdValue = json['attr_std_value'];
    if (json['attrDescPopUp'] != null) {
      attrDescPopUp = <AttrDescPopUp>[];
      json['attrDescPopUp'].forEach((v) {
        attrDescPopUp!.add(AttrDescPopUp.fromJson(v));
      });
    }
    attrLocalSizeValue = json['attr_local_size_value'];
    countryCode = json['country_code'];
    if (json['attr_value_local_size'] != null) {
      attrValueLocalSize = <AttrValueLocalSize>[];
      json['attr_value_local_size'].forEach((v) {
        attrValueLocalSize!.add(AttrValueLocalSize.fromJson(v));
      });
    }
    sizeGatherTag = json['size_gather_tag'];
    goodsId = json['goods_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['attr_value_id'] = attrValueId;
    data['attr_value_name'] = attrValueName;
    data['attr_value_name_en'] = attrValueNameEn;
    data['attr_std_value'] = attrStdValue;
    if (attrDescPopUp != null) {
      data['attrDescPopUp'] = attrDescPopUp!.map((v) => v.toJson()).toList();
    }
    data['attr_local_size_value'] = attrLocalSizeValue;
    data['country_code'] = countryCode;
    if (attrValueLocalSize != null) {
      data['attr_value_local_size'] =
          attrValueLocalSize!.map((v) => v.toJson()).toList();
    }
    data['size_gather_tag'] = sizeGatherTag;
    data['goods_id'] = goodsId;
    return data;
  }
}

class AttrDescPopUp {
  List<BindAttrData>? bindAttrData;

  AttrDescPopUp({bindAttrData});

  AttrDescPopUp.fromJson(Map<String, dynamic> json) {
    if (json['bindAttrData'] != null) {
      bindAttrData = <BindAttrData>[];
      json['bindAttrData'].forEach((v) {
        bindAttrData!.add(BindAttrData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (bindAttrData != null) {
      data['bindAttrData'] = bindAttrData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BindAttrData {
  int? sort;
  String? attrNameKey;
  String? attrNameValue;

  BindAttrData({sort, attrNameKey, attrNameValue});

  BindAttrData.fromJson(Map<String, dynamic> json) {
    sort = json['sort'];
    attrNameKey = json['attrNameKey'];
    attrNameValue = json['attrNameValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sort'] = sort;
    data['attrNameKey'] = attrNameKey;
    data['attrNameValue'] = attrNameValue;
    return data;
  }
}

class AttrValueLocalSize {
  String? countryCode;
  String? attrLocalSizeValue;

  AttrValueLocalSize({countryCode, attrLocalSizeValue});

  AttrValueLocalSize.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'];
    attrLocalSizeValue = json['attr_local_size_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['country_code'] = countryCode;
    data['attr_local_size_value'] = attrLocalSizeValue;
    return data;
  }
}

class AttrValueSizeCountry {
  String? countryCode;

  AttrValueSizeCountry({countryCode});

  AttrValueSizeCountry.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['country_code'] = countryCode;
    return data;
  }
}
