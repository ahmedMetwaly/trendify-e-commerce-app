import 'package:flutter/material.dart';

import '../../../../model/product_models/poduct_description_model.dart';
import '../../../../resources/string_manager.dart';
import '../../../../resources/values_manager.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.productDetails,
  });

  final List<ProductDescriptionModel> productDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  SizeManager.bottomSheetRadius,
                ),
                topRight: Radius.circular(
                  SizeManager.bottomSheetRadius,
                ))),
        child: Column(
          children: [
            Text(
              StringManager.description,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            Divider(
              color: Theme.of(context).colorScheme.outline,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "${productDetails[index].attrName}:",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      productDetails[index].attrValue ?? "",
                    ),
                  )
                ],
              ),
              itemCount: productDetails.length,
            ),
          ],
        ));
  }
}
