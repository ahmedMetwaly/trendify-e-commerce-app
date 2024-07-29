import 'package:shop_app/repositeries/date/date_format.dart';

class Coupon {
  String? couponCode;
  String? discount;
  String? expiryDate;
  String? expiredTime;
  String? startDate;
  String? startTime;
  String? describtion;
  String? duration;
  Coupon({
    required this.couponCode,
    required this.discount,
    required this.expiryDate,
    required this.startDate,
    required this.describtion,
    required this.startTime,
    required this.expiredTime,
    this.duration,
  });
  Coupon.fromJson(Map<String, dynamic> json) {
    couponCode = json["couponCode"];
    discount = json["discount"];
    expiryDate = json["expiryDate"];
    expiredTime = json["expiredTime"];
    startDate = json["startDate"];
    startTime = json["startTime"];
    describtion = json["description"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["couponCode"] = couponCode!.toUpperCase();
    data["discount"] = discount;
    data["startDate"] = HandlingDate(date: startDate!).convertDate();
    data["startTime"] = startTime!;
    data["expiryDate"] = HandlingDate(date: expiryDate!).convertDate();
    data["expiredTime"] = expiredTime;
    data["description"] = describtion;
    return data;
  }
}
