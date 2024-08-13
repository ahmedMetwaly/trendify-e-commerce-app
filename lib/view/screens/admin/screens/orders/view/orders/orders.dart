import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/view/screens/admin/screens/orders/bloc/order_states.dart';
import 'package:shop_app/view/screens/admin/screens/orders/bloc/orders_bloc.dart';
import 'package:shop_app/generated/l10n.dart';
import 'package:shop_app/resources/values_manager.dart';
import '../../models/order_model.dart';
import '../../../../../../components/button_group.dart';
import 'widgets/order_list.dart';
import 'widgets/search_orders.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<OrderBloc>().getOrders();

    return BlocBuilder<OrderBloc, OrderStates>(
      builder: (BuildContext context, OrderStates state) {
        return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      showSearch(
                          context: context,
                          delegate: MySearchDelegate(context
                              .read<OrderBloc>()
                              .orders
                              .map((order) => order.id)
                              .toList()));
                    })
              ],
              bottom: Tab(
                  height: 110,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1, horizontal: PaddingManager.pMainPadding),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.current.orders,
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          const SizedBox(height: SizeManager.sSpace16),
                          const ButtonGroup()
                        ]),
                  )),
            ),
            /*   floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<OrderBloc>().addOrder(
                      OrderModel(
                          id: "${context.read<OrderBloc>().orders.length + 1}",
                          user: UserModel(
                              uid: "1212",
                              phoneNumber: "012316876542",
                              name: "Mero",
                              email: "mero@gmail.com",
                              address: "13 nasr city, cairo, egypt",
                              imageUrl:
                                  "https://firebasestorage.googleapis.com/v0/b/trendify-5ffe2.appspot.com/o/products_main_pictures%2F3XYFh4eFTu5jarEzUe1mFF3F51B51.jpg?alt=media&token=6e279c14-863b-41a2-92fa-fc99e6483e72",
                              password: null),
                          orderDate: '2022-01-02',
                          orderTime:
                              HandlingTime(time: TimeOfDay.now().toString())
                                  .handleTime(),
                          total: "200.0",
                          products: [
                            ProductOrder(
                              name: 'Dress',
                              color: "FF3F51B5",
                              quantity: 2,
                              size: "XL",
                              brand: "Nike",
                              price: 80.0,
                              imageUrl:
                                  'https://firebasestorage.googleapis.com/v0/b/trendify-5ffe2.appspot.com/o/products_main_pictures%2FAekVEGu34IcmGwvuHqy5mainImage.jpg?alt=media&token=cefff361-5535-4812-9b67-8c91ddecd93e',
                            ),
                            ProductOrder(
                              name: 'Shoes',
                              price: 60.0,
                              color: "FF3F51B5",
                              quantity: 2,
                              size: "XL",
                              brand: "Nike",
                              imageUrl:
                                  'https://firebasestorage.googleapis.com/v0/b/trendify-5ffe2.appspot.com/o/products_main_pictures%2FAekVEGu34IcmGwvuHqy5mainImage.jpg?alt=media&token=cefff361-5535-4812-9b67-8c91ddecd93e',
                            ),
                          ],
                          salePrecentage: "10",
                          deliveryAmount: "15",
                          paymentMethod: "Master card",
                          state: DetectOrderStateRepo(
                                  state: OrderStatesE.pending)
                              .detectState()),
                    );
              },
              child: Icon(Icons.add),
            ),
           */
            body: body(context.read<OrderBloc>().specificOrder, state));
      },
    );
  }
}

Widget body(List<OrderModel> orders, state) {
  if (state is LoadingOrderState) {
    const Center(child: CircularProgressIndicator());
  }

  if (orders.isEmpty && state is SuccessOrderState) {
    return Center(
      child: Text(S.current.noOrdersFound),
    );
  }
  if (state is SuccessOrderState) {
    return OrdersList(
      orders: orders,
    );
  }

  if (state is AddedOrderState) {
    return OrdersList(
      orders: orders,
    );
  }
  if (state is UpdatedOrderState) {
    return OrdersList(orders: orders);
  }
  return const Center(child: CircularProgressIndicator());
}
