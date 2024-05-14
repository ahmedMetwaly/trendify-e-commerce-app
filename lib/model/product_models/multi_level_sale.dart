
import 'size_model.dart';

class MultiLevelSaleAttribute {
  String? skcName;
  String? goodsSn;
  String? goodsId;
  List<SkcSaleAttr>? skcSaleAttr;

  MultiLevelSaleAttribute({skcName, goodsSn, goodsId, skcSaleAttr});

  MultiLevelSaleAttribute.fromJson(Map<String, dynamic> json) {
    skcName = json['skc_name'];
    goodsSn = json['goods_sn'];
    goodsId = json['goods_id'];

    if (json['skc_sale_attr'] != null) {
      skcSaleAttr = <SkcSaleAttr>[];
      json['skc_sale_attr'].forEach((v) {
        skcSaleAttr!.add(SkcSaleAttr.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['skc_name'] = skcName;
    data['goods_sn'] = goodsSn;
    data['goods_id'] = goodsId;
    if (skcSaleAttr != null) {
      data['skc_sale_attr'] = skcSaleAttr!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
