import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/coupon_bloc/coupon_bloc.dart';
import 'package:shop_app/bloc/admin/coupon_bloc/coupon_states.dart';
import 'package:shop_app/model/admin_models/coupon_model.dart';
import 'package:shop_app/view/components/dialogs.dart';
import 'package:shop_app/view/screens/admin/screens/admin_home/screens/coupons/widgets/time_picker.dart';
import '../../../../../../../../generated/l10n.dart';
import '../../../../../../../../resources/values_manager.dart';
import '../../../../../../../components/elevated_button.dart';
import '../../../../../../signup/widgets/name.dart';
import '../../add_product/widgets/number_input.dart';
import 'date_picker.dart';

//TODO :: make the expired date starts from the starts date
class AddNewCoupon extends StatelessWidget {
  const AddNewCoupon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController couponCode = TextEditingController();
    final TextEditingController salePrecentage = TextEditingController();
    final TextEditingController describtion = TextEditingController();
    final TextEditingController startAt = TextEditingController();
    final TextEditingController startTime = TextEditingController();
    final TextEditingController expiredAt = TextEditingController();
    final TextEditingController expiredTime = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<CouponBloc, CouponStates>(
        builder: (BuildContext context, CouponStates state) => Form(
            key: formKey,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                height: MediaQuery.of(context).size.height,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(SizeManager.bottomSheetRadius),
                        topRight:
                            Radius.circular(SizeManager.bottomSheetRadius))),
                child: SingleChildScrollView(
                  //  controller: scrollController,
                  child: Column(
                    children: [
                      Text(
                        S.current.addNewCoupon,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 10),
                      Divider(
                        height: 8,
                        thickness: 2,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      const SizedBox(height: 10),
                      Name(
                          nameController: couponCode,
                          title: S.current.couponCode),
                      const SizedBox(height: 10),
                      NumberInput(
                        controller: salePrecentage,
                        label: S.current.salePrecentage,
                        onEditingComplete: (value) {},
                      ),
                      const SizedBox(height: 10),
                      DatePickerWidget(
                        label: S.current.startAt,
                        controller: startAt,
                      ),
                      const SizedBox(height: 10),
                      TimePickerWidget(
                          controller: startTime, label: S.current.startTime),
                      const SizedBox(height: 10),
                      DatePickerWidget(
                        label: S.current.expiredAt,
                        controller: expiredAt,
                      ),
                      const SizedBox(height: 10),
                      TimePickerWidget(
                          controller: expiredTime,
                          label: S.current.expiredTime),
                      const SizedBox(height: 10),
                      Name(
                          nameController: describtion,
                          title: S.current.describtion),
                      const SizedBox(height: 10),
                      MyElevatedButton(
                          title: S.current.addNewCoupon,
                          onPress: () async {
                            if (formKey.currentState!.validate()) {
                              Coupon coupon = Coupon(
                                  couponCode: couponCode.text,
                                  discount: salePrecentage.text,
                                  expiryDate: expiredAt.text,
                                  expiredTime: expiredTime.text,
                                  startDate: startAt.text,
                                  startTime: startTime.text,
                                  describtion: describtion.text);

                              await context
                                  .read<CouponBloc>()
                                  .addNewCoupon(coupon)
                                  .then((value) {
                                Navigator.of(context).pop();
                              });
                            }
                          }),
                      const SizedBox(height: 10),
                    ],
                  ),
                ))),
        listener: (BuildContext context, CouponStates state) {
          if (state is LoadingNewCouponState ||
              state is LoadingDeleteCouponState) {
            showLoadingDialog(context);
          }
          if (state is DeleteCouponState) {
            Navigator.of(context).pop();
          }
          if (state is AddNewCouponState) {
            Navigator.of(context).pop();
          }

          if (state is FailedCouponState) {
            Navigator.of(context).pop();

            errorDialog(context, S.current.error, state.errorMessage);
          }
        },
      ),
    );
  }

  bool checkIfCouponCodeFound(List<Coupon> coupons, String couponCode) {
    coupons.map((coupon) {
      if (coupon.couponCode == couponCode.trim().toUpperCase()) {
        print("fond");
        return true;
      }
    });
    return false;
  }
}
