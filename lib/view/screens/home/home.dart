import "package:flutter/material.dart";
import "package:shop_app/resources/image_manager.dart";
import "package:shop_app/resources/routes.dart";
import "package:shop_app/resources/string_manager.dart";
import "package:shop_app/resources/values_manager.dart";
import "../../components/display_section.dart";
import "widgets/categories.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 490,
              elevation: 10,
              flexibleSpace: FlexibleSpaceBar(
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
                            fixedSize: const MaterialStatePropertyAll<Size>(
                                Size(20, 20)),
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
                background: Image.asset(
                  ImageManager.homeSliverAppBar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  DisplaySection(
                    sectionTitle: StringManager.sNew,
                    sectionSlogan: StringManager.neverSeen,
                    sectionRoute: Routes.onBoarding,
                    productLabel: StringManager.sNew,
                    productLabelBColor: Theme.of(context).colorScheme.surface,
                  ),
                  const Categories(),
                   DisplaySection(
                    sectionTitle: StringManager.sale,
                    sectionSlogan: StringManager.superSale,
                    sectionRoute: Routes.onBoarding,
                    productLabel: "-20%",
                    productLabelBColor: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                ],
              ),
            ),
          ],
        );
  }
}
