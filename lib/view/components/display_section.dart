import 'package:flutter/material.dart';
import '../../model/admin_models/product.dart';
import '../../resources/values_manager.dart';
import 'product_item.dart';
import 'section_bar.dart';

class DisplaySection extends StatelessWidget {
  const DisplaySection({
    super.key,
    required this.sectionTitle,
    required this.sectionSlogan,
    required this.sectionRoute, required this.products,
  
  });
  final String sectionTitle;
  final String sectionSlogan;
  final String sectionRoute;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionBar(
          title: sectionTitle,
          slogan: sectionSlogan,
          goto: sectionRoute,
        ),
        Container(
          height: SizeManager.sectionSize,
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingManager.pMainPadding,
              vertical: PaddingManager.p10),
          child: ListView.separated(
            itemBuilder: (context, index) => ProductItem(
              product: products[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
