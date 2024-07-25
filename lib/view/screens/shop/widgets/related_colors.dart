import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:shop_app/model/admin_models/product.dart";
import "package:shop_app/model/category_products/partition_products_model.dart";
import "package:shop_app/resources/values_manager.dart";
import "package:shop_app/view/components/product_item.dart";
import "package:shop_app/view_model/bloc/app_states.dart";
import "package:shop_app/view_model/bloc/partition_view_model.dart";

import "../../../../resources/string_manager.dart";

class RelatedColors extends StatelessWidget {
  const RelatedColors({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionViewModel, AppStates>(
      builder: (context, state) {
        final viewModel = SectionViewModel.get(context);
        final List<Product> products = /* viewModel.products!.item ??  */[];
        products.shuffle();
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingManager.pMainPadding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              StringManager.relatedProducts,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: SizeManager.sSpace,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ProductItem(
                  product: products[index],
                  boxFit: BoxFit.cover,
                ),
                itemCount: 4,
              ),
            ),
          ]),
        );
      },
    );
  }
}
