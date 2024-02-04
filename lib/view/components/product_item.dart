import 'package:flutter/material.dart';
import 'package:shop_app/resources/values_manager.dart';
import 'package:shop_app/view/components/image_from_network.dart';
import 'package:shop_app/view/screens/home/widgets/label.dart';

import 'fav_btn.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.category,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.label,
    required this.labelColor,
    this.width = 200,
    this.hieght = SizeManager.sectionSize,
    this.boxFit = BoxFit.fill,
  });
  final String category;
  final String title;
  final String price;
  final String imageUrl;
  final String label;
  final Color labelColor;
  final double? width;
  final double? hieght;
  final BoxFit ? boxFit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hieght,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ImageFromNetwork(
                    imagePath: imageUrl,
                    
                    height: 200, 
                    fit:boxFit,
                  ),
                ),
              ),
              Positioned(
                left: 9.0,
                top: 9.0,
                child: Label(labelTitle: label, color: labelColor),
              ),
              const FavBtn(),
            ],
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
