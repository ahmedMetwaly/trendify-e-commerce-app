
class MaterialDetailsModel {
  String? attrName;
  String? attrValue;

  MaterialDetailsModel({attrName, attrValue});

  MaterialDetailsModel.fromJson(Map<String, dynamic> json) {
    attrName = json['attr_name'];
    attrValue = json['attr_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['attr_name'] = attrName;
    data['attr_value'] = attrValue;
    return data;
  }
}
