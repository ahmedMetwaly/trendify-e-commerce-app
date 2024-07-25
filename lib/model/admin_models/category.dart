class CategoryModel {
   String? gender;
   String? section;
  CategoryModel({ this.gender,  this.section});
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
