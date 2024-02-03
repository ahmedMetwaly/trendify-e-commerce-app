import "package:flutter/material.dart";

import "../../../../resources/image_manager.dart";
import "../../../../resources/string_manager.dart";
import "../../../../resources/values_manager.dart";
import "category_btn.dart";

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.93,
      width: size.width,
      child: Column(
        children: [
          CategoryBtn(
            height: size.height * 0.47,
            width: double.infinity,
            imagePath: ImageManager.home2,
            title: StringManager.womenCollection,
            onPressed: () => print("goto women's screen"),
          ),
          Row(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      //TODO::Goto to sale page
                    },
                    child: Container(
                      height: size.height * 0.23,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 4,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(
                              PaddingManager.pInternalPadding),
                          child: Text(
                            StringManager.superSale.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ),
                    ),
                  ),
                  CategoryBtn(
                      onPressed: () => print("goto jeweller screen"),
                      imagePath: ImageManager.home4,
                      height: size.height * 0.23,
                      width: size.width * 0.5,
                      title: StringManager.jewellery),
                ],
              ),
              CategoryBtn(
                  onPressed: () => print("goto mens screen"),
                  imagePath: ImageManager.home3,
                  height: size.height * 0.46,
                  width: size.width * 0.5,
                  title: StringManager.mensCollection),
            ],
          ),
        ],
      ),
    );
  }
}
