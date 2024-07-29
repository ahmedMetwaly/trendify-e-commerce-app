import '../../../model/admin_models/coupon_model.dart';

abstract class CouponStates {}

class InitialCouponState extends CouponStates {}

class AddNewCouponState extends CouponStates{}
class LoadingNewCouponState extends CouponStates{}
class LoadingCouponState extends CouponStates {}
class LoadingDeleteCouponState extends CouponStates{}
class DeleteCouponState extends CouponStates{}
class SuccessCouponState extends CouponStates {
  final List<Coupon> coupons;

  SuccessCouponState({required this.coupons});
}

class FailedCouponState extends CouponStates {
  final String errorMessage;

  FailedCouponState({required this.errorMessage});
}
