
class MainSaleAttribute {
  String? mainSaleAttrDesc;
  String? canShowLargeImg;
  String? mainSaleAttrShowMode;

  MainSaleAttribute(
      {mainSaleAttrDesc, canShowLargeImg, mainSaleAttrShowMode, info});

  MainSaleAttribute.fromJson(Map<String, dynamic> json) {
    mainSaleAttrDesc = json['mainSaleAttrDesc'];
    canShowLargeImg = json['canShowLargeImg'];
    mainSaleAttrShowMode = json['mainSaleAttrShowMode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['mainSaleAttrDesc'] = mainSaleAttrDesc;
    data['canShowLargeImg'] = canShowLargeImg;
    data['mainSaleAttrShowMode'] = mainSaleAttrShowMode;
  
    return data;
  }
}

