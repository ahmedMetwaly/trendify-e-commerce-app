import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/coupon_bloc/coupon_states.dart';
import 'package:shop_app/repositeries/coupon/add_coupon_repo.dart';

import '../../../model/admin_models/coupon_model.dart';
import '../../../repositeries/coupon/delete_coupon_repo.dart';
import '../../../repositeries/coupon/get_coupons_repo.dart';

class CouponBloc extends Cubit<CouponStates> {
  CouponBloc() : super(InitialCouponState());

  List<Coupon> coupons = [];
  Future getCoupons() async {
    try {
      emit(LoadingCouponState());
      coupons = await GetCouponsRepo().getCoupons();
      emit(SuccessCouponState(coupons: coupons));
    } catch (error) {
      emit(FailedCouponState(errorMessage: error.toString()));
    }
  }

  Future addNewCoupon(Coupon coupon) async {
    try {
      emit(LoadingNewCouponState());
      await AddNewCouponRepo().addNewCoupon(coupon);
      await getCoupons();
      emit(AddNewCouponState());
    } catch (error) {
      emit(FailedCouponState(errorMessage: error.toString()));
    }
  }

  Future deleteCoupon(String couponCode) async {
    try {
      emit(LoadingDeleteCouponState());
      await DeleteCouponRepo(couponCode: couponCode).deleteCoupon();
      await getCoupons();
      emit(DeleteCouponState());
    } catch (error) {
      emit(FailedCouponState(errorMessage: error.toString()));
    }
  }
}
