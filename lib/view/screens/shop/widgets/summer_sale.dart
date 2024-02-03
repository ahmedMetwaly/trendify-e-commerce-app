import 'package:flutter/material.dart';

import '../../../../resources/string_manager.dart';
import '../../../../resources/values_manager.dart';

class SummerSale extends StatelessWidget {
  const SummerSale({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
        final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height*0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeManager.borderRadius),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringManager.summerSale.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w900),
            ),
            Text(
              StringManager.upTo.toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ],
        ),
      ),
    );
  }
}
