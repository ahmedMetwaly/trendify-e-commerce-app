
class SkuInfoList {
  String? isMain;
  String? attributeNameId;
  String? attributeNameEn;
  String? attributeNameMulti;
  String? attributeValueId;
  String? attributeValueEn;
  String? attributeValueMulti;
  String? isColor;

  SkuInfoList(
      {this.isMain,
      this.attributeNameId,
      this.attributeNameEn,
      this.attributeNameMulti,
      this.attributeValueId,
      this.attributeValueEn,
      this.attributeValueMulti,
      this.isColor});

  SkuInfoList.fromJson(Map<String, dynamic> json) {
    isMain = json['is_main'];
    attributeNameId = json['attribute_name_id'];
    attributeNameEn = json['attribute_name_en'];
    attributeNameMulti = json['attribute_name_multi'];
    attributeValueId = json['attribute_value_id'];
    attributeValueEn = json['attribute_value_en'];
    attributeValueMulti = json['attribute_value_multi'];
    isColor = json['is_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['is_main'] = isMain;
    data['attribute_name_id'] = attributeNameId;
    data['attribute_name_en'] = attributeNameEn;
    data['attribute_name_multi'] = attributeNameMulti;
    data['attribute_value_id'] = attributeValueId;
    data['attribute_value_en'] = attributeValueEn;
    data['attribute_value_multi'] = attributeValueMulti;
    data['is_color'] = isColor;
    return data;
  }
}
