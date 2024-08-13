import '../models/order_model.dart';

abstract class OrderStates {}

class InitialOrderState extends OrderStates {}

class LoadingOrderState extends OrderStates {}

class AddedOrderState extends OrderStates {}

class SuccessOrderState extends OrderStates {
  final List<OrderModel> orders;

  SuccessOrderState({required this.orders});
}
class UpdatingOrderState extends OrderStates {}


class UpdatedOrderState extends OrderStates {}

class FailedOrderState extends OrderStates {
  final String error;
  FailedOrderState({required this.error});
}
