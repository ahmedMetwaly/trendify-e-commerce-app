import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/view/screens/admin/screens/orders/bloc/order_states.dart';
import 'package:shop_app/view/screens/admin/screens/orders/bloc/orders_bloc.dart';
import 'package:shop_app/generated/l10n.dart';
import 'package:shop_app/resources/values_manager.dart';
import 'package:shop_app/view/components/dialogs.dart';
import 'package:shop_app/view/screens/admin/screens/orders/view/view_order_details/widgets/property.dart';
import '../../models/order_model.dart';
import '../../repositeries/detect_state_repo.dart';
import '../../repositeries/invoice_repo.dart';
import '../../../../../../components/elevated_button.dart';
import 'widgets/order_infromations_order_card.dart';
import 'widgets/product_item._in_order_card.dart';
import 'widgets/user_informations_in_order.dart';

class ViewOrderDetials extends StatelessWidget {
  const ViewOrderDetials({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderModel order =
        ModalRoute.of(context)!.settings.arguments as OrderModel;
    final InvoiceRepo invoice = InvoiceRepo(
        products: order.products,
        deliveryAmount: double.parse(order.deliveryAmount),
        salePrecentage: double.parse(order.salePrecentage));
    final Map<String, dynamic> invoiceReprt = invoice.calculateTotalAmount();

    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.orderDetails),
      ),
      body: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${S.current.order} ${order.id}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(order.orderDate,
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              const SizedBox(height: SizeManager.sSpace16),
              Property(
                  propertyName: S.current.totalItems,
                  value: "${invoiceReprt["quantity"]} ${S.current.items}"),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(order.state,
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold))),
              const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: order.products.length,
                itemBuilder: (context, index) => ProductItemInOrderCard(
                  product: order.products[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
              ),
              const SizedBox(height: SizeManager.sSpace16),
              UserInfromationIsnOrderCard(order: order),
              const SizedBox(height: SizeManager.sSpace16),
              OrderInformationsInOrderCard(
                  order: order, invoiceReprt: invoiceReprt),
              const SizedBox(height: 16),
              order.state == S.current.cancelled
                  ? const SizedBox()
                  : BlocConsumer<OrderBloc, OrderStates>(
                      builder: (BuildContext context, OrderStates state) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          order.state == S.current.returned
                              ? const SizedBox()
                              : MyElevatedButton(
                                  onPress: () {
                                    context
                                        .read<OrderBloc>()
                                        .updateOrderState(
                                            orderID: order.id,
                                            orderState: DetectOrderStateRepo()
                                                .detectNextState(order.state))
                                        .then((value) {
                                      context
                                          .read<OrderBloc>()
                                          .getOrdersByState(
                                              DetectOrderStateRepo()
                                                  .detectOrderState(
                                                      order.state));

                                      Navigator.of(context).pop();
                                    });
                                  },
                                  title: DetectOrderStateRepo()
                                      .detectNextState(order.state),
                                ),
                          const SizedBox(width: SizeManager.sSpace16),
                          order.state == S.current.delivered
                              ? const SizedBox()
                              : MyElevatedButton(
                                  onPress: () {
                                    context
                                        .read<OrderBloc>()
                                        .updateOrderState(
                                            orderID: order.id,
                                            orderState: DetectOrderStateRepo(
                                                    state:
                                                        OrderStatesE.cancelled)
                                                .detectState())
                                        .then((value) {
                                      context
                                          .read<OrderBloc>()
                                          .getOrdersByState(
                                              DetectOrderStateRepo()
                                                  .detectOrderState(
                                                      order.state));
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  title: S.current.cancel,
                                ),
                        ],
                      ),
                      listener: (BuildContext context, OrderStates state) {
                        if (state is UpdatingOrderState) {
                          showLoadingDialog(context);
                        }
                        if (state is UpdatedOrderState) {
                          Navigator.of(context).pop();
                        }
                      },
                    ),
              const SizedBox(height: SizeManager.sSpace),
            ],
          ),
        ),
      ),
    );
  }
}
