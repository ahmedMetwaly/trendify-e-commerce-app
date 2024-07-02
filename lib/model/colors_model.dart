class ColorsModel {
  String? colorName;
  String? colorCode;
  List<String>? imagesUrl;
  ColorsModel({this.colorCode, this.colorName, this.imagesUrl});
  ColorsModel.fromJson(Map<String, dynamic> json) {
    colorCode = json['colorCode'];
    colorName = json['colorName'];
    imagesUrl = json["imagesUrl"];
  }
  Map<String,dynamic> toJson (){
    Map<String,dynamic> data ={};
    data["colorCode"] = colorCode;
    data["colorName"] = colorName;
    data["imagesUrl"] = imagesUrl;
    return data; 
  }
}
