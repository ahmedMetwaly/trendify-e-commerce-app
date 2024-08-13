import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../resources/values_manager.dart';
import 'number_input.dart';

class PriceInfo extends StatelessWidget {
  const PriceInfo({
    super.key,
    required this.price,
    required this.salePrecentage,
  });

  final TextEditingController price;
  final TextEditingController salePrecentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          borderRadius: BorderRadius.circular(SizeManager.borderRadius),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          )),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.attach_money_rounded,
                size: 30,
              ),
              const SizedBox(
                width: SizeManager.sSpace,
              ),
              Text(
                S.current.PriceInfo,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: SizeManager.sSpace16),
          NumberInput(
            controller: price,
            label: S.current.price,
            onEditingComplete: (value){},
          ),
          const SizedBox(height: SizeManager.sSpace16),
          NumberInput(
            controller: salePrecentage,
            label: S.current.salePrecentage,
                        onEditingComplete: (value){},

          ),
          const SizedBox(height: SizeManager.sSpace16),
        ],
      ),
    );
  }
}
