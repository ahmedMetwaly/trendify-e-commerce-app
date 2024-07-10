class CategoryModel {
  late String gender;
  late String section;
  CategoryModel({required this.gender, required this.section});
  CategoryModel.fromJson(Map<String, dynamic> json) {
    gender = json["gender"];
    section = json["section"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["gender"] = gender;
    data["section"] = section;
    return data;
  }
}
