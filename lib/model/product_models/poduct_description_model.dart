class ProductDescriptionModel {
  String? heelHeightRangeDesc;
  String? isHeelHeight;
  String? attrName;
  String? attrValue;
  String? attrNameEn;
  int? attrId;
  int? valueSort;
  String? attrDesc;
  String? attrImage;
  String? attrImgList;
  int? attrSort;
  String? attrValueId;
  int? attrValueIdForSort;

  ProductDescriptionModel(
      {heelHeightRangeDesc,
      isHeelHeight,
      attrName,
      attrValue,
      attrNameEn,
      attrId,
      valueSort,
      attrDesc,
      attrImage,
      attrImgList,
      attrSort,
      attrValueId,
      attrValueIdForSort});

  ProductDescriptionModel.fromJson(Map<String, dynamic> json) {
    heelHeightRangeDesc = json['heelHeightRangeDesc'];
    isHeelHeight = json['isHeelHeight'];
    attrName = json['attr_name'];
    attrValue = json['attr_value'];
    attrNameEn = json['attr_name_en'];
    attrId = json['attr_id'];
    valueSort = json['value_sort'];
    attrDesc = json['attr_desc'];
    attrImage = json['attr_image'];
    attrImgList = json['attrImgList'];
    attrSort = json['attr_sort'];
    attrValueId = json['attr_value_id'];
    attrValueIdForSort = json['attr_value_id_for_sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['heelHeightRangeDesc'] = heelHeightRangeDesc;
    data['isHeelHeight'] = isHeelHeight;
    data['attr_name'] = attrName;
    data['attr_value'] = attrValue;
    data['attr_name_en'] = attrNameEn;
    data['attr_id'] = attrId;
    data['value_sort'] = valueSort;
    data['attr_desc'] = attrDesc;
    data['attr_image'] = attrImage;
    data['attrImgList'] = attrImgList;
    data['attr_sort'] = attrSort;
    data['attr_value_id'] = attrValueId;
    data['attr_value_id_for_sort'] = attrValueIdForSort;
    return data;
  }
}
