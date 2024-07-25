class Review {
  String? userUrlImage;
  String? email;
  String? comment;
  double? numberOfStars;
  Review({this.userUrlImage, this.email, this.comment, this.numberOfStars});
  Review.fromJson(Map<String, dynamic> json) {
    userUrlImage = json["userUrlImage"];
    email = json["email"];
    comment = json["comment"];
    numberOfStars = json["numberOfStars"];
  }
  Map<String, dynamic> toJson() {
    Map<String,dynamic> data ={};
    data["userUrlImage"] = userUrlImage;
    data["email"] = email;
    data["comment"] = comment;
    data["numberOfStars"] = numberOfStars;
    return data;
}}
