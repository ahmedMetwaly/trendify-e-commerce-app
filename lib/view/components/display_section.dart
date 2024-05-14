import 'package:flutter/material.dart';
import 'package:shop_app/model/product_models/product_details_model.dart';
import '../../resources/values_manager.dart';
import 'product_item.dart';
import 'section_bar.dart';

class DisplaySection extends StatelessWidget {
  const DisplaySection({
    super.key,
    required this.sectionTitle,
    required this.sectionSlogan,
    required this.sectionRoute, required this.products,
  
  });
  final String sectionTitle;
  final String sectionSlogan;
  final String sectionRoute;
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionBar(
          title: sectionTitle,
          slogan: sectionSlogan,
          goto: sectionRoute,
        ),
        Container(
          height: SizeManager.sectionSize,
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingManager.pMainPadding,
              vertical: PaddingManager.p10),
          child: ListView.separated(
            itemBuilder: (context, index) => ProductItem(
              id: 21943155,
              label:"",
              labelColor: Colors.black,
              title: "T-Shirt Sailling",
              brandName: " women's clothing",
              imageUrl:
                  "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
              retailPrice: " 9.99",
              salePrice: "5.5",
              goodsSn: "snasns",
              productRelationID: "lsakklsj",
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
