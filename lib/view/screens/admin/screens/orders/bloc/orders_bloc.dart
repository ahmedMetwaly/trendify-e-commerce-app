import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/view/screens/admin/screens/orders/bloc/order_states.dart';
import 'package:shop_app/view/screens/admin/screens/orders/repositeries/add_order_repo.dart';
import 'package:shop_app/view/screens/admin/screens/orders/repositeries/detect_state_repo.dart';

import '../models/order_model.dart';
import '../repositeries/get_orders_repo.dart';
import '../repositeries/update_order_repo.dart';

class OrderBloc extends Cubit<OrderStates> {
  OrderBloc() : super(InitialOrderState());
  List<OrderModel> orders = [];
  List<OrderModel> specificOrder = [];
  Future getOrders() async {
    try {
      emit(LoadingOrderState());
      print("getting orders");
      orders = await GetOrdersRepo().getOrders();
      print("got orders");
      print(orders);
      getOrdersByState(OrderStatesE.pending);
      emit(SuccessOrderState(orders: orders));
    } catch (error) {
      emit(FailedOrderState(error: error.toString()));
    }
  }

  void getOrdersByState(OrderStatesE orderState) {
    try {
      emit(LoadingOrderState());
      specificOrder = orders
          .where((element) =>
              element.state ==
              DetectOrderStateRepo(state: orderState).detectState())
          .toList();
      specificOrder.sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id)));
      emit(SuccessOrderState(orders: specificOrder));
    } catch (error) {
      emit(FailedOrderState(error: error.toString()));
    }
  }

  OrderModel getOrderById(String id) {
    return orders.firstWhere((order) => order.id == id);
  }

  //TODO:: only user can make order then will update order list in user model
  Future addOrder(OrderModel order) async {
    try {
      emit(LoadingOrderState());
      await AddOrderRepo().addNewOrder(order);
      orders = await GetOrdersRepo().getOrders();
      print("got orders");
      print(orders);
      getOrdersByState(OrderStatesE.pending);
      emit(AddedOrderState());
    } catch (error) {
      emit(FailedOrderState(error: error.toString()));
    }
  }

  //TODO:: update the state of the order by the admin and update on the user by getting its id then update the order list
  Future updateOrderState(
      {required String orderID, required String orderState}) async {
    try {
      emit(UpdatingOrderState());
      await UpdateOrderRepo().updateOrderState(orderID, orderState);
      await getOrders();
      emit(UpdatedOrderState());
    } catch (error) {
      emit(FailedOrderState(error: error.toString()));
    }
  }
}
