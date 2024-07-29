import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/coupon_bloc/coupon_bloc.dart';
import 'package:shop_app/repositeries/date/date_format.dart';
import 'package:shop_app/view/components/label.dart';
import '../../../../../../../../generated/l10n.dart';
import '../../../../../../../../model/admin_models/coupon_model.dart';
import 'coupon_state.dart';

class CouponCard extends StatelessWidget {
  final Coupon coupon;

  const CouponCard({
    super.key,
    required this.coupon,
  });
//TODO:: make states of coipon and function to delete it
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text(S.of(context).delete),
          content: Text(S.of(context).deleteContent),
          actions: [
            TextButton(onPressed: () {
              context.read<CouponBloc>().deleteCoupon(coupon.couponCode!);
              Navigator.of(context).pop();
              }, child: Text(S.current.delete)),
              TextButton(onPressed: () {
                Navigator.of(context).pop();
                }, child: Text(S.current.cancel)),
                ],
                
        ),);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    coupon.couponCode!,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  Label(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    labelTitle: "${coupon.discount!} % ${S.current.off}",
                    labelColor: Theme.of(context).primaryColor,
                    labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                S.current.startAt +
                    HandlingDate(date: coupon.startDate!).handleDate(),
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              const SizedBox(height: 6),
              Center(child: CouponState(coupon: coupon)),
              const SizedBox(height: 6),
              Text(
                S.current.expiredAt +
                    HandlingDate(date: coupon.expiryDate!).handleDate(),
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                coupon.describtion!,
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
