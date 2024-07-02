import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:shop_app/resources/colors_manager.dart";
import "package:shop_app/resources/routes.dart";
import "package:shop_app/resources/string_manager.dart";
import "package:shop_app/view/components/gallary_view.dart";
import 'package:shop_app/view/screens/shop/widgets/related_colors.dart';
import 'package:shop_app/view/screens/shop/widgets/size_options.dart';
import "package:shop_app/view_model/bloc/app_states.dart";
import "package:shop_app/view_model/bloc/product_view_model.dart";
import "../../../resources/values_manager.dart";
import "../../components/fav_btn.dart";
import "../../components/space.dart";
import "size_guide.dart";
import "widgets/add_to_cart.dart";
import "widgets/cart_icon.dart";
import "widgets/color_option.dart";
import "widgets/material_details.dart";
import 'widgets/product_description.dart';
import "widgets/title_and_price.dart";

class ProductDetails extends StatefulWidget {
  const ProductDetails(
      {super.key, required this.id, required this.sn, required this.sku});
  final int id;
  final String sn;
  final String sku;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int indx = 0;
  @override
  void initState() {
    super.initState();
    ProductViewModel.get(context).getProduct(widget.id, widget.sn, widget.sku);
  }

  @override
  Widget build(BuildContext context) {
    //final productInfo = widget.productData!.info;
    return BlocBuilder<ProductViewModel, AppStates>(
      builder: (BuildContext context, AppStates state) {
        final ProductViewModel viewModel = ProductViewModel.get(context);
        final productInfo = viewModel.product?.info;
        print(state);
        if (state is LoadingState) {
          return const Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        } else if (state is CompleteState) {
          return Scaffold(
              appBar: AppBar(
                actions: [
                  const CartIcon(),
                  IconButton(
                      onPressed: () {
                        //TODO: share link of product
                      },
                      icon: Icon(
                        Icons.share,
                        color: Theme.of(context).colorScheme.surface,
                      ))
                ],
              ),
              bottomNavigationBar: AddToCart(
                id: int.parse(productInfo?.goodsId ?? ""),
                goodSn: productInfo?.goodsSn ?? "",
                sku: productInfo?.productRelationID ?? "",
              ),
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                      expandedHeight: MediaQuery.of(context).size.height * 0.6,
                      elevation: 10,
                      leading: const SizedBox(),
                      flexibleSpace: FlexibleSpaceBar(
                        background: GallaryView(
                          fromNetwork: true,
                            galleryItems: productInfo!
                                .detailImages!.colorImages![indx].values.first),
                        titlePadding:
                            const EdgeInsets.all(PaddingManager.pMainPadding),
                        title: const SizedBox(
                            width: 35, height: 35, child: FavBtn()),
                      )),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        TitleAndPrice(
                          title: '${productInfo.goodsName}',
                          brandName: "${productInfo.brandBadge}",
                          retailPrice: "${productInfo.retailPrice!.amount}",
                          salePrice: "${productInfo.salePrice!.amount}",
                          discountAmount: "${productInfo.unitDiscount}",
                          isOnSale: "${productInfo.isOnSale}",
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: PaddingManager.pMainPadding),
                            child: Text(
                              StringManager.color,
                              style: Theme.of(context).textTheme.headlineSmall,
                            )),
                        const Space(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: SizeManager.colorOptionSize,
                          child: ListView.builder(
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: PaddingManager.p10),
                              child: ColorOption(
                                onPressed: () => setState(() => indx = index),
                                colorUrl: productInfo.detailImages!
                                    .colorImages![index].values.first.first,
                              ),
                            ),
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(
                                horizontal: PaddingManager.pMainPadding),
                            itemCount:
                                productInfo.detailImages!.colorImages!.length,
                          ),
                        ),
                        const Space(),
                        SizeOption(
                          availableSizes:
                              productInfo.attrSizeDict?.availableSizes ?? [],
                          sizesDetails:
                              productInfo.attrSizeDict?.sizeDetails ?? [],
                        ),
                        ListTile(
                          title: Text(
                            StringManager.sizeGuide,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: SizeManager.arrowSize,
                          ),
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SizeGuide(
                                sizeTemplate: productInfo.sizeTemplate),
                          )),
                        ),
                        MaterialDetails(
                            materialDetails: productInfo.materialDetails),
                        ListTile(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => ProductDescription(
                                  productDetails:
                                      productInfo.productDetails ?? []),
                            );
                          },
                          title: Text(
                            StringManager.description,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: SizeManager.arrowSize,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(SizeManager.borderRadius),
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.15),
                          ),
                          child: ListTile(
                            title: Text(
                              productInfo.returnTitle ?? "",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            leading: const Icon(
                              Icons.shopping_bag_rounded,
                              color: ColorsManager.success,
                            ),
                          ),
                        ),
                        ListTile(
                            title: Text(
                              StringManager.reviews,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: SizeManager.arrowSize,
                            ),
                            onTap: () => Navigator.of(context)
                                .pushNamed(Routes.reviews)),
                       const SizedBox(height: SizeManager.sSpace,),
                        const RelatedColors(),
                      ],
                    ),
                  )
                ],
              ));
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
