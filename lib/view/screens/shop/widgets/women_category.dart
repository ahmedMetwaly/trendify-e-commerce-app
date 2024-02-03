import "package:flutter/material.dart";
import "package:shop_app/resources/image_manager.dart";
import "package:shop_app/resources/string_manager.dart";
import "package:shop_app/resources/values_manager.dart";
import "package:shop_app/view/screens/shop/widgets/summer_sale.dart";

import "section.dart";

class WomenCategory extends StatelessWidget {
  const WomenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(PaddingManager.pMainPadding),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            SummerSale(),
            Section(
              sectionLabel: StringManager.clothes,
              sectionImagePath: ImageManager.clothes,
            ),
            Section(
              sectionLabel: StringManager.shoes,
              sectionImagePath: ImageManager.shoes,
            ),
            Section(
              sectionLabel: StringManager.accessories,
              sectionImagePath: ImageManager.accessories,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
          ]),
    );
  }
}
