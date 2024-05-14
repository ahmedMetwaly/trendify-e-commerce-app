class MemberSize {
  String? ruleNameEn;
  String? languageName;
  String? sizeValue;

  MemberSize({this.ruleNameEn, this.languageName, this.sizeValue});

  MemberSize.fromJson(Map<String, dynamic> json) {
    ruleNameEn = json['rule_name_en'];
    languageName = json['language_name'];
    sizeValue = json['size_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['rule_name_en'] = ruleNameEn;
    data['language_name'] = languageName;
    data['size_value'] = sizeValue;
    return data;
  }
}
