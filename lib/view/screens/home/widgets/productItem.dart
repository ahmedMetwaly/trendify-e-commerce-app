import 'package:flutter/material.dart';
import 'package:shop_app/resources/values_manager.dart';
import 'package:shop_app/view/components/image_from_network.dart';
import 'package:shop_app/view/screens/home/widgets/label.dart';

import 'favBtn.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.category,
      required this.title,
      required this.price,
      required this.imageUrl,
      required this.label,
      required this.labelColor});
  final String category;
  final String title;
  final String price;
  final String imageUrl;
  final String label;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeManager.sectionSize,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 270,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ImageFromNetwork(
                      imagePath: imageUrl,
                      width: 190,
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  left: 9.0,
                  top: 9.0,
                  child: Label(labelTitle: label, color: labelColor),
                ),
                const favBtn(),
              ],
            ),
          ),
          Text(category, style: Theme.of(context).textTheme.bodySmall),
          Text(
            title,
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          Text(
            "$price\$",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
