import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:shop_app/resources/colors_manager.dart";
import "package:shop_app/resources/routes.dart";
import "package:shop_app/resources/string_manager.dart";
import "package:shop_app/view/components/gallary_view.dart";
import "package:shop_app/view/screens/user/bloc/user_bloc/user_state.dart";
import "package:shop_app/view/screens/user/view/screens/shop/view/widgets/category_informations.dart";
import 'package:shop_app/view/screens/user/view/screens/shop/view/widgets/size_options.dart';
import "../../../../../../../../model/admin_models/product.dart";
import "../../../../../../../../resources/values_manager.dart";
import "../../../../../../../components/fav_btn.dart";
import "../../../../../../../components/space.dart";
import "../../../../../bloc/user_bloc/user_bloc.dart";
import "size_guide.dart";
import "../widgets/add_to_cart.dart";
import "../widgets/cart_icon.dart";
import "../widgets/color_option.dart";
import "../widgets/material_details.dart";
import "../widgets/title_and_price.dart";

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int indx = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
        builder: (BuildContext context, UserState state) {
      
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
            id: widget.product.id ?? "",
          ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height * 0.6,
                  elevation: 10,
                  leading: const SizedBox(),
                  flexibleSpace: FlexibleSpaceBar(
                    background: GallaryView(
                      justDisplay: true,
                      fromNetwork: false,
                      galleryItems: widget.product.colors?[indx].imagesUrl
                          ?.cast<String>(),
                    ),
                    titlePadding:
                        const EdgeInsets.all(PaddingManager.pMainPadding),
                    title: const SizedBox(
                        width: 35,
                        height: 35,
                        child: ActionBtn(
                          deleteBtn: false,
                        )),
                  )),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    TitleAndPrice(
                      title: '${widget.product.title}',
                      brandName: "${widget.product.brand}",
                      retailPrice: "${widget.product.price}",
                      salePrice:
                          "${double.parse(widget.product.price ?? "0") - ((double.parse(widget.product.salePrecentage ?? "0") / 100) * double.parse(widget.product.price ?? "0"))}",
                      salePrecentage: "${widget.product.salePrecentage}",
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
                            colorCode:
                                widget.product.colors![index].colorCode ?? "",
                            colorName:
                                widget.product.colors![index].colorName ?? "",
                          ),
                        ),
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(
                            horizontal: PaddingManager.pMainPadding),
                        itemCount: widget.product.colors!.length,
                      ),
                    ),
                    const Space(),
                    SizeOption(
                      availableSizes: widget.product.availableSizes ?? [],
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
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            SizeGuide(imageUrl: widget.product.sizeImage ?? ""),
                      )),
                    ),
                    MaterialDetails(productMaterial: widget.product.material),
                    const Space(),
                    DisplayCategoryInformations(
                      categoryModel: widget.product.category,
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
                          "return policy",
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
                        onTap: () =>
                            Navigator.of(context).pushNamed(Routes.reviews)),
                    const SizedBox(
                      height: SizeManager.sSpace,
                    ),
                    //const RelatedColors(),
                  ],
                ),
              )
            ],
          ));
    });
  }
}
