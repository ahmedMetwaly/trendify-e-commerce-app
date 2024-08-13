// ignore_for_file: deprecated_member_use

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:shop_app/resources/image_manager.dart";
import "package:shop_app/resources/routes.dart";
import "package:shop_app/resources/string_manager.dart";
import "package:shop_app/resources/values_manager.dart";
import "package:shop_app/view/screens/user/view/screens/home/bloc/section_bloc.dart";
import "package:shop_app/view/screens/user/view/screens/home/view/widgets/recommendation_section.dart";
import "widgets/display_section.dart";
import "widgets/categories.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.69,
          elevation: 10,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              ImageManager.homeSliverAppBar,
              fit: BoxFit.cover,
            ),
            titlePadding: const EdgeInsets.all(PaddingManager.pMainPadding),
            title: SizedBox(
              width: SizeManager.sliverAppbarTitle,
              child: ListView(
                reverse: true,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //TODO:: goto Sale page
                    },
                    style: ButtonStyle(
                        fixedSize:
                            const WidgetStatePropertyAll<Size>(Size(20, 20)),
                        foregroundColor: MaterialStatePropertyAll<Color>(
                            Theme.of(context).colorScheme.inversePrimary),
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            Theme.of(context).colorScheme.primary)),
                    child: const Text(StringManager.check),
                  ),
                  Text(StringManager.appbarTitle,
                      style: Theme.of(context).textTheme.headlineLarge),
                ],
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              context.read<SectionBloc>().newProducts.isEmpty
                  ? const SizedBox() //TODO:: Recommendation Section From history
                  : const DisplaySection(
                      sectionTitle: StringManager.sNew,
                      sectionSlogan: StringManager.neverSeen,
                      sectionRoute: Routes.onBoarding,
                    ),
              const RecommendationSection(),
              const Categories(),
              const DisplaySection(
                sectionTitle: StringManager.sale,
                sectionSlogan: StringManager.superSale,
                sectionRoute: Routes.onBoarding,
              ),
              SizedBox(
                  height: MediaQuery.of(context)
                          .size
                          .bottomCenter(Offset.zero)
                          .distance *
                      0.072),
            ],
          ),
        ),
      ],
    );
  }
}
