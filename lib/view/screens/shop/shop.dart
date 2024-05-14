import "package:flutter/material.dart";
import "package:shop_app/resources/string_manager.dart";
import 'package:shop_app/view/screens/shop/tab_bar/jewellery_category.dart';
import 'package:shop_app/view/screens/shop/tab_bar/men_category.dart';
import 'package:shop_app/view/screens/shop/tab_bar/women_category.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          shadowColor: Theme.of(context).colorScheme.surface,
          title: Text(
            StringManager.categories,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.surface,
                )),
          ],
          bottom: TabBar(
              labelColor: Theme.of(context).colorScheme.surface,
              labelStyle: Theme.of(context).textTheme.headlineSmall,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Theme.of(context).colorScheme.inversePrimary,
              tabs: const [
                Tab(
                  text: StringManager.women,
                ),
                Tab(
                  text: StringManager.men,
                ),
                Tab(
                  text: StringManager.jewellery,
                )
              ]),
        ),
        body: const TabBarView(children: [
          WomenCategory(),
          MenCategory(),
          JewelleryCategory(),
        ]),
      ),
    );
  }
}
