
class RelatedColorGoods {
  String? attrDesc;
  String? attrImage;
  String? goodsId;
  String? goodsSn;
  String? goodsColorName;
  String? goodsImage;
  String? goodsColorImage;
  int? spuSort;
  int? attrSort;
  int? valueSort;
  String? attrId;
  String? attrName;
  String? attrValueId;
  String? attrValue;
  int? attrValueIdForSort;
  String? hotColor;
  String? isEco;

  RelatedColorGoods(
      {attrDesc,
      attrImage,
      goodsId,
      goodsSn,
      goodsColorName,
      goodsImage,
      goodsColorImage,
      spuSort,
      attrSort,
      valueSort,
      attrId,
      attrName,
      attrValueId,
      attrValue,
      attrValueIdForSort,
      hotColor,
      isEco});

  RelatedColorGoods.fromJson(Map<String, dynamic> json) {
    attrDesc = json['attrDesc'];
    attrImage = json['attrImage'];
    goodsId = json['goods_id'];
    goodsSn = json['goods_sn'];
    goodsColorName = json['goods_color_name'];
    goodsImage = json['goods_image'];
    goodsColorImage = json['goods_color_image'];
    spuSort = json['spu_sort'];
    attrSort = json['attr_sort'];
    valueSort = json['value_sort'];
    attrId = json['attr_id'];
    attrName = json['attr_name'];
    attrValueId = json['attr_value_id'];
    attrValue = json['attr_value'];
    attrValueIdForSort = json['attr_value_id_for_sort'];
    hotColor = json['hot_color'];
    isEco = json['isEco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['attrDesc'] = attrDesc;
    data['attrImage'] = attrImage;
    data['goods_id'] = goodsId;
    data['goods_sn'] = goodsSn;
    data['goods_color_name'] = goodsColorName;
    data['goods_image'] = goodsImage;
    data['goods_color_image'] = goodsColorImage;
    data['spu_sort'] = spuSort;
    data['attr_sort'] = attrSort;
    data['value_sort'] = valueSort;
    data['attr_id'] = attrId;
    data['attr_name'] = attrName;
    data['attr_value_id'] = attrValueId;
    data['attr_value'] = attrValue;
    data['attr_value_id_for_sort'] = attrValueIdForSort;
    data['hot_color'] = hotColor;
    data['isEco'] = isEco;
    return data;
  }
}
