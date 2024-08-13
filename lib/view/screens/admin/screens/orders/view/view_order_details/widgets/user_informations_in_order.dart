import 'package:flutter/material.dart';

import '../../../../../../../../generated/l10n.dart';
import '../../../models/order_model.dart';
import '../../../../../../../../resources/values_manager.dart';
import 'property.dart';

class UserInfromationIsnOrderCard extends StatelessWidget {
  const UserInfromationIsnOrderCard({
    super.key,
    required this.order,
  });

  final OrderModel order;

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
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(S.current.userInformations,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 8),
          Property(
              propertyName: S.current.customer, value: order.user.name ?? ""),
          const SizedBox(height: 8),
          Property(
              propertyName: S.current.shippingAddress,
              value: order.user.address ?? ""),
          const SizedBox(height: 8),
          Property(
              propertyName: S.current.phoneNumber,
              value: order.user.phoneNumber ?? ""),
          const SizedBox(height: 8),
          Property(
              propertyName: S.current.email, value: order.user.email ?? ""),
        ],
      ),
    );
  }
}
