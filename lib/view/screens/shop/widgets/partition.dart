import 'package:flutter/material.dart';
import 'package:shop_app/resources/values_manager.dart';
import 'package:shop_app/view/components/product_item.dart';
import '../../../components/bottom_sheet.dart';

class Partetion extends StatelessWidget {
  const Partetion({
    super.key,
    required this.partetionTitle,
    required this.products,
  });
  final String partetionTitle;
  final List<ProductItem> products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          shadowColor: Theme.of(context).colorScheme.outline,
          title: Text(
            partetionTitle,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // TODO: search on clothes section
                },
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.surface,
                )),
          ],
          bottom: bottomSheet(
            context,
          ),
        ),
        body: GridView(
          padding: const EdgeInsets.all(PaddingManager.pMainPadding),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing:PaddingManager.p10,
            childAspectRatio: 0.55,
          ),
          children: products,
        ));
  }
}
