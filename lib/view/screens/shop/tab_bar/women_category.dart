import "package:flutter/material.dart";
import "package:shop_app/resources/image_manager.dart";
import "package:shop_app/resources/string_manager.dart";
import "package:shop_app/resources/values_manager.dart";
import "package:shop_app/view/components/space.dart";
import "package:shop_app/view/screens/shop/widgets/summer_sale.dart";

import '../widgets/section.dart';

class WomenCategory extends StatelessWidget {
  const WomenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AdSection(
                title: StringManager.summerSale,
                subTitle: StringManager.upTo,
              ),
              const Space(),
              const Section(
                sectionId: 1738,
                sectionLabel: StringManager.tShirts,
                sectionImagePath: ImageManager.womenTshirt,
              ),
              const Space(),
              const Section(
                sectionId: 2990,
                sectionLabel: StringManager.pants,
                sectionImagePath: ImageManager.womenPants,
              ),
              const Space(),
              const Section(
                sectionId: 1913,
                sectionLabel: StringManager.shoes,
                sectionImagePath: ImageManager.shoes,
              ),
              const Space(),
              const Section(
                sectionId: 3016,
                sectionLabel: StringManager.accessories,
                sectionImagePath: ImageManager.accessories,
              ),
              SizedBox(
                height: MediaQuery.of(context)
                        .size
                        .bottomCenter(Offset.zero)
                        .distance *
                    0.12,
              ),
            ]),
      ),
    );
  }
}
