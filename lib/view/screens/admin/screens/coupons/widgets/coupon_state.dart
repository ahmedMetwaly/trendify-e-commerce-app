
import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../model/admin_models/coupon_model.dart';
import '../../../../../../repositeries/date/date_difference.dart';

class CouponState extends StatefulWidget {
  const CouponState({
    super.key,
    required this.coupon,
  });

  final Coupon coupon;

  @override
  State<CouponState> createState() => _CouponStateState();
}

class _CouponStateState extends State<CouponState> {
  @override
  Widget build(BuildContext context) {
    List stateWithDuration = DateDifference().differenceBetweenDates(
        expiredDate: widget.coupon.expiryDate!,
        expiredTime: widget.coupon.expiredTime!,
        startDate: widget.coupon.startDate!,
        startTime: widget.coupon.startTime!);
    String state = stateWithDuration[0];
    int duration = stateWithDuration[1];
    switch (state) {
      case "future":
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            S.current.futureCoupon,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
        );
      case "active":
        return SlideCountdownSeparated(
            decoration: const BoxDecoration(color: Colors.green),
            onDone: () {
              setState(() {
                state = "expired";
              });
            },
            duration: Duration(seconds: duration));

      case "expired":
        return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              S.current.finished,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ));
      default:
        return Text(S.current.error);
    }
       
  }
}
