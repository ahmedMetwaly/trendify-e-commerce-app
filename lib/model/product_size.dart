class ProductSize {
  late String availableSize;
  late String sizeDiscription;
  ProductSize({required this.availableSize,required this.sizeDiscription});
  ProductSize.fromJson(Map<String, dynamic>json){
    availableSize = json['availableSize'];
    sizeDiscription = json['sizeDiscription']; 
  }
   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["availableSize"] = availableSize;
    data["sizeDiscription"] = sizeDiscription;
    return data;
  }
}
