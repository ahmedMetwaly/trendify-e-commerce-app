import "package:flutter/material.dart";
import "package:shop_app/view/components/product_item.dart";
import "../../../../../resources/values_manager.dart";

class JewelleryCategory extends StatelessWidget {
  const JewelleryCategory({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductItem> products = [
      ProductItem(
          boxFit: BoxFit.cover,
          category: "jewellery's category",
          title: "Blouse",
          price: "99",
          imageUrl:
              "https://previews.123rf.com/images/boykung/boykung1711/boykung171100050/90695258-jewellery-ring-on-a-white-background-high-resolution-3d-image.jpg",
          label: "New",
          labelColor: Theme.of(context).colorScheme.surface),
      ProductItem(
          boxFit: BoxFit.cover,
          category: "jewellery's category",
          title: "Blouse",
          price: "99",
          imageUrl:
              "https://previews.123rf.com/images/boykung/boykung1711/boykung171100050/90695258-jewellery-ring-on-a-white-background-high-resolution-3d-image.jpg",
          label: "New",
          labelColor: Theme.of(context).colorScheme.surface),
      ProductItem(
          boxFit: BoxFit.cover,
          category: "jewellery's category",
          title: "Blouse",
          price: "99",
          imageUrl:
              "https://previews.123rf.com/images/boykung/boykung1711/boykung171100050/90695258-jewellery-ring-on-a-white-background-high-resolution-3d-image.jpg",
          label: "New",
          labelColor: Theme.of(context).colorScheme.surface),
      ProductItem(
          boxFit: BoxFit.cover,
          category: "jewellery's category",
          title: "Blouse",
          price: "99",
          imageUrl:
              "https://previews.123rf.com/images/boykung/boykung1711/boykung171100050/90695258-jewellery-ring-on-a-white-background-high-resolution-3d-image.jpg",
          label: "New",
          labelColor: Theme.of(context).colorScheme.surface),
      ProductItem(
          boxFit: BoxFit.cover,
          category: "jewellery's category",
          title: "Blouse",
          price: "99",
          imageUrl:
              "https://previews.123rf.com/images/boykung/boykung1711/boykung171100050/90695258-jewellery-ring-on-a-white-background-high-resolution-3d-image.jpg",
          label: "New",
          labelColor: Theme.of(context).colorScheme.surface),
      ProductItem(
          boxFit: BoxFit.cover,
          category: "jewellery's category",
          title: "Blouse",
          price: "99",
          imageUrl:
              "https://previews.123rf.com/images/boykung/boykung1711/boykung171100050/90695258-jewellery-ring-on-a-white-background-high-resolution-3d-image.jpg",
          label: "New",
          labelColor: Theme.of(context).colorScheme.surface),
      ProductItem(
          boxFit: BoxFit.cover,
          category: "jewellery's category",
          title: "Blouse",
          price: "99",
          imageUrl:
              "https://previews.123rf.com/images/boykung/boykung1711/boykung171100050/90695258-jewellery-ring-on-a-white-background-high-resolution-3d-image.jpg",
          label: "New",
          labelColor: Theme.of(context).colorScheme.surface),
      ProductItem(
          boxFit: BoxFit.cover,
          category: "jewellery's category",
          title: "Blouse",
          price: "99",
          imageUrl:
              "https://previews.123rf.com/images/boykung/boykung1711/boykung171100050/90695258-jewellery-ring-on-a-white-background-high-resolution-3d-image.jpg",
          label: "New",
          labelColor: Theme.of(context).colorScheme.surface),
    ];

    return GridView(
      padding: const EdgeInsets.all(PaddingManager.pMainPadding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: PaddingManager.p10,
        childAspectRatio: 0.6,
      ),
      children: products,
    );
  }
}
