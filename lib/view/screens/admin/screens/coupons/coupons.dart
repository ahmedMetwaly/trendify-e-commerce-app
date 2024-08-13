import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:shop_app/bloc/admin/coupon_bloc/coupon_bloc.dart";
import "package:shop_app/bloc/admin/coupon_bloc/coupon_states.dart";
import "package:shop_app/generated/l10n.dart";
import "widgets/add_new_coupon.dart";
import "widgets/show_coupons.dart";

class Coupons extends StatelessWidget {
  const Coupons({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CouponBloc>().getCoupons();
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.coupons),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              useSafeArea: true,
              builder: (context) => const AddNewCoupon());
        },
        child: Icon(Icons.add,
            color: Theme.of(context).colorScheme.inversePrimary),
      ),
      body: BlocBuilder<CouponBloc, CouponStates>(
        builder: (BuildContext context, CouponStates state) {
          if (state is LoadingCouponState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is SuccessCouponState) {
            if (context.read<CouponBloc>().coupons.isEmpty) {
              return Center(child: Text(S.current.no_coupons_found));
            } else {
              return const ShowCoupons();
            }
          }
          return const ShowCoupons();
        },
      ),
    );
  }
}
