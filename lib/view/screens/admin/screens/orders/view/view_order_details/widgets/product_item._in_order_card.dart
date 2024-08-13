import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../../../../generated/l10n.dart';
import '../../../../../../../../resources/values_manager.dart';
import '../../../../../../../components/image_from_network.dart';
import '../../../models/product_order_model.dart';

class ProductItemInOrderCard extends StatelessWidget {
  const ProductItemInOrderCard({
    super.key,
    required this.product,
  });
  final ProductOrder product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeManager.orderItemHieght,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(SizeManager.radiusOfBNB)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(SizeManager.radiusOfBNB),
                  topLeft: Radius.circular(SizeManager.radiusOfBNB)),
              child: ImageFromNetwork(
                imagePath: product.imageUrl,
                height: SizeManager.orderItemHieght,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: SizeManager.sSpace16),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  product.brand,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text('${S.current.color}: ',
                                style: Theme.of(context).textTheme.bodySmall),
                            Expanded(
                              child: Text(ColorTools.nameThatColor(
                                  HexColor("#${product.color}"))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text('${S.current.size}: ',
                                style: Theme.of(context).textTheme.bodySmall),
                            Text(product.size),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text('${S.current.quantity}: ',
                                style: Theme.of(context).textTheme.bodySmall),
                            Text(product.quantity.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Text('${S.current.price}: ',
                          style: Theme.of(context).textTheme.bodySmall),
                      Text("${product.price} ${S.current.currency}"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
