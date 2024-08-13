
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../bloc/admin/coupon_bloc/coupon_bloc.dart';
import '../../../../../../resources/values_manager.dart';
import 'coupon_card.dart';

class ShowCoupons extends StatelessWidget {
  const ShowCoupons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<CouponBloc>().getCoupons();
      },
      child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: ListView.separated(
            itemBuilder: (context, index) => CouponCard(
                  coupon: context.read<CouponBloc>().coupons[index],
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: SizeManager.sSpace,
                ),
            itemCount: context.read<CouponBloc>().coupons.length),
      ),
    );
  }
}
