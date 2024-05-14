class CommentImage {
  String? memberImageOriginal;
  String? memberImageMiddle;
  String? memberImageSmall;

  CommentImage(
      {this.memberImageOriginal,
      this.memberImageMiddle,
      this.memberImageSmall});

  CommentImage.fromJson(Map<String, dynamic> json) {
    memberImageOriginal = json['member_image_original'];
    memberImageMiddle = json['member_image_middle'];
    memberImageSmall = json['member_image_small'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['member_image_original'] = memberImageOriginal;
    data['member_image_middle'] = memberImageMiddle;
    data['member_image_small'] = memberImageSmall;
    return data;
  }
}
