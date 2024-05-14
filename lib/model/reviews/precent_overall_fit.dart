
class PercentOverallFit {
  String? trueSize;
  String? large;
  String? small;

  PercentOverallFit({this.trueSize, this.large, this.small});

  PercentOverallFit.fromJson(Map<String, dynamic> json) {
    trueSize = json['true_size'];
    large = json['large'];
    small = json['small'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['true_size'] = trueSize;
    data['large'] = large;
    data['small'] = small;
    return data;
  }
}
