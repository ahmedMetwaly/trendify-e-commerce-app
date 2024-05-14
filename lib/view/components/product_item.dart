import 'package:flutter/material.dart';
import 'package:shop_app/resources/values_manager.dart';
import 'package:shop_app/view/components/image_from_network.dart';
import 'package:shop_app/view/components/label.dart';
import 'package:shop_app/view/screens/shop/product_details.dart';
import '../../resources/string_manager.dart';
import 'fav_btn.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.brandName,
    required this.title,
    required this.retailPrice,
    required this.imageUrl,
    required this.label,
    required this.labelColor,
    this.width = 200,
    this.hieght = SizeManager.sectionSize,
    this.boxFit = BoxFit.fill,
    required this.id,
    required this.salePrice,
    required this.goodsSn,
    required this.productRelationID,
  });
  final String brandName;
  final String title;
  final String retailPrice;
  final String salePrice;
  final String imageUrl;
  final String label;
  final int id;
  final String? goodsSn;
  final String? productRelationID;
  final Color labelColor;
  final double? width;
  final double? hieght;
  final BoxFit? boxFit;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetails(
              id: id, sn: goodsSn ?? "", sku: productRelationID ?? ""))),
      child: SizedBox(
        height: hieght,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(PaddingManager.p8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ImageFromNetwork(
                      imagePath: imageUrl,
                      height: 200,
                      fit: boxFit,
                    ),
                  ),
                ),
                Positioned(
                  left: 9.0,
                  top: 9.0,
                  child: Padding(
                    padding: const EdgeInsets.all(PaddingManager.p5),
                    child: Label(labelTitle: label, color: labelColor),
                  ),
                ),
                const Positioned(right: 0, bottom: 0, child: FavBtn()),
              ],
            ),
            Text(brandName, style: Theme.of(context).textTheme.bodySmall),
            Text(
              title,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Text("$retailPrice\$",
                    style: label == StringManager.sNew
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
                label == StringManager.sNew
                    ? const SizedBox()
                    : Text(
                        "$salePrice\$",
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
