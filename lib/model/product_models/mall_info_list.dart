import 'retail_price.dart';

class MallInfoList {
	String? stock;
	RetailPrice? retailPrice;
	RetailPrice? salePrice;
	List<String>? mallDescription;
	String? mallCode;
	String? mallName;
	String? mallSort;
	String? unitDiscount;

	MallInfoList({stock, retailPrice, salePrice, mallDescription, mallCode, mallName, mallSort, unitDiscount});

	MallInfoList.fromJson(Map<String, dynamic> json) {
		stock = json['stock'];
		retailPrice = json['retailPrice'] != null ?  RetailPrice.fromJson(json['retailPrice']) : null;
		salePrice = json['salePrice'] != null ?  RetailPrice.fromJson(json['salePrice']) : null;
		mallDescription = json['mallDescription'].cast<String>();
		mallCode = json['mall_code'];
		mallName = json['mall_name'];
		mallSort = json['mall_sort'];
		unitDiscount = json['unit_discount'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = {};
		data['stock'] = stock;
		if (retailPrice != null) {
      data['retailPrice'] = retailPrice!.toJson();
    }
		if (salePrice != null) {
      data['salePrice'] = salePrice!.toJson();
    }
		data['mallDescription'] = mallDescription;
		data['mall_code'] = mallCode;
		data['mall_name'] = mallName;
		data['mall_sort'] = mallSort;
		data['unit_discount'] = unitDiscount;
		return data;
	}
}
