import 'package:flutter/material.dart';
import 'package:shop_app/resources/values_manager.dart';
import 'package:shop_app/view/components/product_item.dart';
import 'package:shop_app/view/screens/shop/widgets/cart_icon.dart';
import '../../../../model/admin_models/product.dart';
import '../../../components/bottom_sheet.dart';

class SectionProducts extends StatelessWidget {
  const SectionProducts({
    super.key,
    this.products,
    this.sectionTitle,
  });
  final List<Product>? products;
  final String? sectionTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          shadowColor: Theme.of(context).colorScheme.outline,
          title: Text(
            sectionTitle ?? "",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
         
          actions: [
            const CartIcon(),
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    // TODO: search on clothes section
                  },
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.surface,
                  )),
            ),
          ],
          bottom: bottomSheet(
            context,
          ),
        ),
        body: GridView(
          padding: const EdgeInsets.all(PaddingManager.pMainPadding),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: PaddingManager.p10,
            childAspectRatio: 0.53,
          ),
          children: products!.map((e)=>ProductItem(product: e)).toList(),
        ));
  }
}
