import 'package:flutter/material.dart';

import '../../../../../../../../generated/l10n.dart';
import '../../../models/order_model.dart';
import '../../../../../../../../resources/values_manager.dart';
import 'property.dart';

class OrderInformationsInOrderCard extends StatelessWidget {
  const OrderInformationsInOrderCard({
    super.key,
    required this.order,
    required this.invoiceReprt,
  });

  final OrderModel order;
  final Map<String, dynamic> invoiceReprt;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.15),
          borderRadius: BorderRadius.circular(SizeManager.borderRadius),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          )),
      child: Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(S.current.orderInformations,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 8),
        Property(
            propertyName: S.current.paymentMethod, value: order.paymentMethod),
        const SizedBox(height: 8),
        Property(
            propertyName: S.current.deliveryAmount,
            value: "${order.deliveryAmount} ${S.current.currency}"),
        const SizedBox(height: 8),
        Property(
            propertyName: S.current.disount, value: "${order.salePrecentage}%"),
        const SizedBox(height: 8),
        Property(
            propertyName: S.current.totalAmount,
            value: "${invoiceReprt["total"]} ${S.current.currency}"),
      ]),
    );
  }
}
