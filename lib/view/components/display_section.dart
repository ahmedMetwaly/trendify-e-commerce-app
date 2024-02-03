import 'package:flutter/material.dart';
import '../../resources/values_manager.dart';
import '../screens/home/widgets/productItem.dart';
import 'section_bar.dart';

class DisplaySection extends StatelessWidget {
  const DisplaySection({
    super.key,
    required this.sectionTitle,
    required this.sectionSlogan,
    required this.sectionRoute,
    required this.productLabel,
    required this.productLabelBColor,
  });
  final String sectionTitle;
  final String sectionSlogan;
  final String sectionRoute;
  final String productLabel;
  final Color productLabelBColor;

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
              label: productLabel.toUpperCase(),
              labelColor: productLabelBColor,
              title: "T-Shirt Sailling",
              category: " women's clothing",
              imageUrl:
                  "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
              price: " 9.99",
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
