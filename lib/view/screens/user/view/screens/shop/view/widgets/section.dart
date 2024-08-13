import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/view_model/bloc/app_states.dart';
import '../../../../../../../../resources/string_manager.dart';
import '../../../../../../../../resources/values_manager.dart';
import '../../../../../../../../view_model/bloc/partition_view_model.dart';
import '../../../../../../../components/product_item.dart';
import 'section_products.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.sectionLabel,
    required this.sectionImagePath,
    required this.sectionId,
  });
  final String sectionLabel;
  final String sectionImagePath;
  final int sectionId;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocConsumer<SectionViewModel, AppStates>(
      builder: (BuildContext context, AppStates state) {
        final viewModel = SectionViewModel.get(context);
        return GestureDetector(
       /*    onTap: () async => {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            )),
            await viewModel.getSectionProducts(sectionId).then((value) {
              List<ProductItem> products = viewModel.products!.item!
                  .map(
                    (product) => ProductItem(
                       brandName: product.brandBadge ?? StringManager.trendify,
                      title: product.goodsName ?? "",
                      retailPrice: product.retailPrice!.amount ?? "",
                      salePrice: product.salePrice!.amount ?? "",
                      imageUrl: product.goodsImg ?? "",
                      label:
                          product.isOnSale == 1 && product.unitDiscount != "0"
                              ? "-${product.unitDiscount}%"
                              : StringManager.sNew,
                      labelColor:
                          product.isOnSale == 1 && product.unitDiscount != "0"
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.surface,
                      id: int.parse(product.goodsId ?? "0"),
                      goodsSn: product.goodsSn,
                      productRelationID: product.productRelationID, 
                      product:Product ,
                      boxFit: BoxFit.cover,
                    ),
                  )
                  .toList();
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => SectionProducts(
                    products: products, sectionTitle: sectionLabel),
              ));
            }),
          },
          */ child: Container(
            height: size.height * .15,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(SizeManager.borderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.outline,
                    blurRadius: SizeManager.sBlurRadius,
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: PaddingManager.pInternalPadding,
                        top: PaddingManager.pInternalPadding,
                        bottom: PaddingManager.pInternalPadding),
                    child: Text(
                      sectionLabel,
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(SizeManager.borderRadius),
                        bottomRight: Radius.circular(SizeManager.borderRadius)),
                    child: Image.asset(
                      sectionImagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, AppStates state) {},
    );
  }
}
