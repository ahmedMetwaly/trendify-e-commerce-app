import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/resources/values_manager.dart';
import 'package:shop_app/view/components/image_from_network.dart';
import 'package:shop_app/view/components/label.dart';
import 'package:shop_app/view/screens/admin/screens/admin_home/screens/edit_product/edit_product.dart';
import 'package:shop_app/view/screens/shop/product_details.dart';
import '../../generated/l10n.dart';
import '../../model/admin_models/product.dart';
import 'fav_btn.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      this.width = 200,
      this.hieght = SizeManager.sectionSize,
      this.boxFit = BoxFit.fill,
      required this.product,
      this.toEdit = false});

  final Product product;
  final double? width;
  final double? hieght;
  final BoxFit? boxFit;
  final bool toEdit;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (toEdit == true) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditProduct(
                    product: product,
                  )));
        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetails(product: product)));
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        height: hieght,
        width: width,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            borderRadius: BorderRadius.circular(SizeManager.radiusOfBNB)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ImageFromNetwork(
                    imagePath: product.mainImage ?? "",
                    height: 220,
                    width: width,
                    fit: boxFit,
                  ),
                ),
                Positioned(
                  left: 9.0,
                  top: 9.0,
                  child: Padding(
                      padding: const EdgeInsets.all(PaddingManager.p5),
                      child: checkLabel(
                          context,
                          product.salePrecentage ?? "0",
                          product.puplishedDate ?? "",
                          int.parse(product.productQuantity ?? "0"))),
                ),
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: ActionBtn(deleteBtn: toEdit, product: product)),
              ],
            ),
            const SizedBox(height: 10),
            Text(product.brand ?? "",
                style: Theme.of(context).textTheme.bodySmall),
            Text(
              product.title ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Text("${product.price}\$",
                    style: product.salePrecentage == "0"
                        ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary)
                        : TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Theme.of(context).colorScheme.outline,
                          )),
                const SizedBox(
                  width: MarginManager.m8,
                ),
                product.salePrecentage == "0"
                    ? const SizedBox()
                    : Text(
                        "${double.parse(product.price ?? "0") - ((double.parse(product.salePrecentage ?? "0") / 100) * double.parse(product.price ?? "0"))}\$",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

int daysBetween(String pastDateString) {
  // Parse the date string into a DateTime object
  final pastDate =
      DateFormat('yyyy-MM-dd HH:mm:ss.SSSSSSS').parse(pastDateString);

  // Get today's date
  final today = DateTime.now();

  // Calculate the difference in days (ignoring time)
  final difference = today.difference(pastDate).inDays;

  return difference;
}

Widget checkLabel(
    BuildContext context, String sale, String puplishedDate, int quantity) {
  if (daysBetween(puplishedDate) < 3) {
    return Label(
        labelTitle: S.current.sNew,
        color: Theme.of(context).colorScheme.surface);
  } else if (double.parse(sale) > 0) {
    return Label(
        labelTitle: "$sale%", color: Theme.of(context).colorScheme.primary);
  } else if (quantity == 0) {
    return Label(
        labelTitle: S.current.soldOut,
        color: Theme.of(context).colorScheme.outline);
  } else {
    return const SizedBox();
  }
}
