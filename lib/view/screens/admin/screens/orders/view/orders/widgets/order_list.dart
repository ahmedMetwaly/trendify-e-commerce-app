import 'package:flutter/material.dart';

import '../../../models/order_model.dart';
import '../../../../../../../../resources/values_manager.dart';
import 'order_card.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({
    super.key,
    required this.orders,
  });
  final List<OrderModel> orders;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: PaddingManager.pMainPadding),
      child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: SizeManager.sSpace16),
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: PaddingManager.pMainPadding),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: orders.length,
            itemBuilder: (context, index) => OrderCard(order: orders[index]),
            separatorBuilder: (context, index) =>
                const SizedBox(height: SizeManager.sSpace16),
          ),
        ]),
      ),
    );
  }
}
