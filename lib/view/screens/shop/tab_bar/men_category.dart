import "package:flutter/material.dart";
import '../../../../resources/image_manager.dart';
import '../../../../resources/string_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../components/space.dart';
import '../widgets/section.dart';
import '../widgets/summer_sale.dart';

class MenCategory extends StatelessWidget {
  const MenCategory({super.key});

  @override
  Widget build(BuildContext context) {
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
              const Section(
                sectionId: 1980,
                sectionLabel: StringManager.tShirts,
                sectionImagePath: ImageManager.hoodies,
              ),
              const Space(),
              const Section(
                sectionId: 1978,
                sectionLabel: StringManager.pants,
                sectionImagePath: ImageManager.pants,
              ),
              const Space(),
              const Section(
                sectionId: 1979,
                sectionLabel: StringManager.shirts,
                sectionImagePath: ImageManager.shirts,
              ),
              const Space(),
              const Section(
                sectionId: 2093,
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
