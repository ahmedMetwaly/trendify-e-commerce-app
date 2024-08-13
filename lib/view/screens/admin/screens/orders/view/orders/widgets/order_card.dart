import 'package:flutter/material.dart';

import 'package:shop_app/resources/routes.dart';
import '../../../../../../../../generated/l10n.dart';
import '../../../models/order_model.dart';
import '../../../../../../../../resources/values_manager.dart';
import '../../view_order_details/widgets/product_item._in_order_card.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          borderRadius: BorderRadius.circular(SizeManager.borderRadius),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          )),
      child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${S.current.order} #${order.id}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${S.current.date}: ${order.orderDate}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${S.current.customer}: ${order.user.name}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${S.current.products}:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.outline),
            ),
            const SizedBox(height: 8),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ProductItemInOrderCard(
                      product: order.products[index],
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: order.products.length),
            const SizedBox(height: 16),
            Text(
              '${S.current.totalAmount}: ${order.total} ${S.current.currency}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  //context.read<OrderBloc>().addOrder(order);
                   Navigator.of(context)
                      .pushNamed(Routes.viewOrderDetials, arguments: order);
                 },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.primary),
                ),
                child: Text(S.current.viewDetails,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
