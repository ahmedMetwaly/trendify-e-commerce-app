import "package:flutter/material.dart";
import "package:shop_app/view/components/product_item.dart";

import "../../../../../resources/image_manager.dart";
import "../../../../../resources/string_manager.dart";
import "../../../../../resources/values_manager.dart";
import "../../../../components/space.dart";
import "../partition.dart";
import "../section.dart";
import "../summer_sale.dart";

class MenCategory extends StatelessWidget {
  const MenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductItem> products = [];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AdSection(
                title: StringManager.buyToday,
                subTitle: StringManager.getYourReward,
              ),
              const Space(),
              Section(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Partetion(
                        partetionTitle: StringManager.hoodies,
                        products: products),
                  ));
                },
                sectionLabel: StringManager.hoodies,
                sectionImagePath: ImageManager.hoodies,
              ),
              const Space(),
              Section(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Partetion(
                        partetionTitle: StringManager.pants,
                        products: products),
                  ));
                },
                sectionLabel: StringManager.pants,
                sectionImagePath: ImageManager.pants,
              ),
              const Space(),
              Section(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Partetion(
                        partetionTitle: StringManager.shirts,
                        products: products),
                  ));
                },
                sectionLabel: StringManager.shirts,
                sectionImagePath: ImageManager.shirts,
              ),
              const Space(),
              Section(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Partetion(
                        partetionTitle: StringManager.shoes,
                        products: products),
                  ));
                },
                sectionLabel: StringManager.shoes,
                sectionImagePath: ImageManager.menShoes,
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
