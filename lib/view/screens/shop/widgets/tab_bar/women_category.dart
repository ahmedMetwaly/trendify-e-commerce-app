import "package:flutter/material.dart";
import "package:shop_app/resources/image_manager.dart";
import "package:shop_app/resources/string_manager.dart";
import "package:shop_app/resources/values_manager.dart";
import "package:shop_app/view/components/space.dart";
import "package:shop_app/view/screens/shop/widgets/partition.dart";
import "package:shop_app/view/screens/shop/widgets/summer_sale.dart";

import "../../../../components/product_item.dart";
import '../section.dart';

class WomenCategory extends StatelessWidget {
  const WomenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: replace it from APIdata
    List<ProductItem> products = [
      ProductItem(
          boxFit: BoxFit.cover,
          category: "Women's category",
          title: "Blouse",
          price: "99",
          imageUrl:
              "https://s3-alpha-sig.figma.com/img/fa11/6ce9/5fe27c6f7b496e811aa346d85d4408ce?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CHv1nXNKBQKZ3yqzFddXrll9reGNdusl-yMFJmzm5HhQWn62uIfXp9DNlzfEOUUH3IK5d93TOVVng8N9UnTQZ68wrJfFjM8Uf4VwSN355Nc0XHsVjlMk-X8oRGwFN~gSFnznPVJtTxTdCvEWORhluU~kkPIEblZEkNsz89Yv1dcqeDmIOA8XoNwLiHVn0arsqMVWPOEXPHx82wSGWzS0xWq12Z2JVhy0wiSdJxEnHDuRHZlNtjzK2t2Y6yRx~QuVCtrG1zre3Rlou~kxVB4uENmGUqSRVAcD75cfTRITjFLG-ZUaC2Eclwjb2eRBRc7FVRFtBWk8uW5JtWgOS1cg8g__",
          label: "New",
          labelColor: Theme.of(context).colorScheme.surface),
      ProductItem(
          boxFit: BoxFit.cover,
          category: "Women's category",
          title: "Blouse",
          price: "99",
          imageUrl:
              "https://s3-alpha-sig.figma.com/img/fa11/6ce9/5fe27c6f7b496e811aa346d85d4408ce?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CHv1nXNKBQKZ3yqzFddXrll9reGNdusl-yMFJmzm5HhQWn62uIfXp9DNlzfEOUUH3IK5d93TOVVng8N9UnTQZ68wrJfFjM8Uf4VwSN355Nc0XHsVjlMk-X8oRGwFN~gSFnznPVJtTxTdCvEWORhluU~kkPIEblZEkNsz89Yv1dcqeDmIOA8XoNwLiHVn0arsqMVWPOEXPHx82wSGWzS0xWq12Z2JVhy0wiSdJxEnHDuRHZlNtjzK2t2Y6yRx~QuVCtrG1zre3Rlou~kxVB4uENmGUqSRVAcD75cfTRITjFLG-ZUaC2Eclwjb2eRBRc7FVRFtBWk8uW5JtWgOS1cg8g__",
          label: "New",
          labelColor: Theme.of(context).colorScheme.surface),
      ProductItem(
          boxFit: BoxFit.cover,
          category: "Women's category",
          title: "Blouse",
          price: "99",
          imageUrl:
              "https://s3-alpha-sig.figma.com/img/fa11/6ce9/5fe27c6f7b496e811aa346d85d4408ce?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CHv1nXNKBQKZ3yqzFddXrll9reGNdusl-yMFJmzm5HhQWn62uIfXp9DNlzfEOUUH3IK5d93TOVVng8N9UnTQZ68wrJfFjM8Uf4VwSN355Nc0XHsVjlMk-X8oRGwFN~gSFnznPVJtTxTdCvEWORhluU~kkPIEblZEkNsz89Yv1dcqeDmIOA8XoNwLiHVn0arsqMVWPOEXPHx82wSGWzS0xWq12Z2JVhy0wiSdJxEnHDuRHZlNtjzK2t2Y6yRx~QuVCtrG1zre3Rlou~kxVB4uENmGUqSRVAcD75cfTRITjFLG-ZUaC2Eclwjb2eRBRc7FVRFtBWk8uW5JtWgOS1cg8g__",
          label: "New",
          labelColor: Theme.of(context).colorScheme.surface),
      ProductItem(
          boxFit: BoxFit.cover,
          category: "Women's category",
          title: "Blouse",
          price: "99",
          imageUrl:
              "https://s3-alpha-sig.figma.com/img/fa11/6ce9/5fe27c6f7b496e811aa346d85d4408ce?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CHv1nXNKBQKZ3yqzFddXrll9reGNdusl-yMFJmzm5HhQWn62uIfXp9DNlzfEOUUH3IK5d93TOVVng8N9UnTQZ68wrJfFjM8Uf4VwSN355Nc0XHsVjlMk-X8oRGwFN~gSFnznPVJtTxTdCvEWORhluU~kkPIEblZEkNsz89Yv1dcqeDmIOA8XoNwLiHVn0arsqMVWPOEXPHx82wSGWzS0xWq12Z2JVhy0wiSdJxEnHDuRHZlNtjzK2t2Y6yRx~QuVCtrG1zre3Rlou~kxVB4uENmGUqSRVAcD75cfTRITjFLG-ZUaC2Eclwjb2eRBRc7FVRFtBWk8uW5JtWgOS1cg8g__",
          label: "New",
          labelColor: Theme.of(context).colorScheme.surface),
      ProductItem(
          boxFit: BoxFit.cover,
          category: "Women's category",
          title: "Blouse",
          price: "99",
          imageUrl:
              "https://s3-alpha-sig.figma.com/img/fa11/6ce9/5fe27c6f7b496e811aa346d85d4408ce?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CHv1nXNKBQKZ3yqzFddXrll9reGNdusl-yMFJmzm5HhQWn62uIfXp9DNlzfEOUUH3IK5d93TOVVng8N9UnTQZ68wrJfFjM8Uf4VwSN355Nc0XHsVjlMk-X8oRGwFN~gSFnznPVJtTxTdCvEWORhluU~kkPIEblZEkNsz89Yv1dcqeDmIOA8XoNwLiHVn0arsqMVWPOEXPHx82wSGWzS0xWq12Z2JVhy0wiSdJxEnHDuRHZlNtjzK2t2Y6yRx~QuVCtrG1zre3Rlou~kxVB4uENmGUqSRVAcD75cfTRITjFLG-ZUaC2Eclwjb2eRBRc7FVRFtBWk8uW5JtWgOS1cg8g__",
          label: "New",
          labelColor: Theme.of(context).colorScheme.surface),
      ProductItem(
          boxFit: BoxFit.cover,
          category: "Women's category",
          title: "Blouse",
          price: "99",
          imageUrl:
              "https://s3-alpha-sig.figma.com/img/fa11/6ce9/5fe27c6f7b496e811aa346d85d4408ce?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CHv1nXNKBQKZ3yqzFddXrll9reGNdusl-yMFJmzm5HhQWn62uIfXp9DNlzfEOUUH3IK5d93TOVVng8N9UnTQZ68wrJfFjM8Uf4VwSN355Nc0XHsVjlMk-X8oRGwFN~gSFnznPVJtTxTdCvEWORhluU~kkPIEblZEkNsz89Yv1dcqeDmIOA8XoNwLiHVn0arsqMVWPOEXPHx82wSGWzS0xWq12Z2JVhy0wiSdJxEnHDuRHZlNtjzK2t2Y6yRx~QuVCtrG1zre3Rlou~kxVB4uENmGUqSRVAcD75cfTRITjFLG-ZUaC2Eclwjb2eRBRc7FVRFtBWk8uW5JtWgOS1cg8g__",
          label: "New",
          labelColor: Theme.of(context).colorScheme.surface),
      ProductItem(
          boxFit: BoxFit.cover,
          category: "Women's category",
          title: "Blouse",
          price: "99",
          imageUrl:
              "https://s3-alpha-sig.figma.com/img/fa11/6ce9/5fe27c6f7b496e811aa346d85d4408ce?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CHv1nXNKBQKZ3yqzFddXrll9reGNdusl-yMFJmzm5HhQWn62uIfXp9DNlzfEOUUH3IK5d93TOVVng8N9UnTQZ68wrJfFjM8Uf4VwSN355Nc0XHsVjlMk-X8oRGwFN~gSFnznPVJtTxTdCvEWORhluU~kkPIEblZEkNsz89Yv1dcqeDmIOA8XoNwLiHVn0arsqMVWPOEXPHx82wSGWzS0xWq12Z2JVhy0wiSdJxEnHDuRHZlNtjzK2t2Y6yRx~QuVCtrG1zre3Rlou~kxVB4uENmGUqSRVAcD75cfTRITjFLG-ZUaC2Eclwjb2eRBRc7FVRFtBWk8uW5JtWgOS1cg8g__",
          label: "New",
          labelColor: Theme.of(context).colorScheme.surface),
      ProductItem(
          boxFit: BoxFit.cover,
          category: "Women's category",
          title: "Blouse",
          price: "99",
          imageUrl:
              "https://s3-alpha-sig.figma.com/img/fa11/6ce9/5fe27c6f7b496e811aa346d85d4408ce?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CHv1nXNKBQKZ3yqzFddXrll9reGNdusl-yMFJmzm5HhQWn62uIfXp9DNlzfEOUUH3IK5d93TOVVng8N9UnTQZ68wrJfFjM8Uf4VwSN355Nc0XHsVjlMk-X8oRGwFN~gSFnznPVJtTxTdCvEWORhluU~kkPIEblZEkNsz89Yv1dcqeDmIOA8XoNwLiHVn0arsqMVWPOEXPHx82wSGWzS0xWq12Z2JVhy0wiSdJxEnHDuRHZlNtjzK2t2Y6yRx~QuVCtrG1zre3Rlou~kxVB4uENmGUqSRVAcD75cfTRITjFLG-ZUaC2Eclwjb2eRBRc7FVRFtBWk8uW5JtWgOS1cg8g__",
          label: "New",
          labelColor: Theme.of(context).colorScheme.surface),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AdSection(
                title: StringManager.summerSale,
                subTitle: StringManager.upTo,
              ),
              const Space(),
              Section(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Partetion(
                        partetionTitle: StringManager.clothes,
                        products: products),
                  ));
                },
                sectionLabel: StringManager.clothes,
                sectionImagePath: ImageManager.clothes,
              ),
              const Space(),
              Section(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Partetion(
                        partetionTitle: StringManager.shoes,
                        products: products),
                  ));
                },
                sectionLabel: StringManager.shoes,
                sectionImagePath: ImageManager.shoes,
              ),
              const Space(),
              Section(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Partetion(
                        partetionTitle: StringManager.accessories,
                        products: products),
                  ));
                },
                sectionLabel: StringManager.accessories,
                sectionImagePath: ImageManager.accessories,
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
