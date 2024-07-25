import 'package:flutter/material.dart';
import 'package:shop_app/model/admin_models/category.dart';

import '../../../../generated/l10n.dart';
import '../../../../resources/values_manager.dart';

class DisplayCategoryInformations extends StatelessWidget {
  const DisplayCategoryInformations({super.key, this.categoryModel});

  final CategoryModel? categoryModel;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      
      title: Text(
        S.current.categoryInformations,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.headlineSmall!.fontWeight,
          fontFamily: Theme.of(context).textTheme.headlineSmall!.fontFamily,
        ),
      ),

      
      textColor: Theme.of(context).colorScheme.primary,
      collapsedTextColor: Theme.of(context).colorScheme.surface,
      childrenPadding: const EdgeInsets.only(
          right: PaddingManager.pMainPadding,
          left: PaddingManager.pMainPadding,
          top: 0,
          bottom: PaddingManager.pInternalPadding),
      children: [
        Row(
          children: [
            Text("${S.current.type}: "),
            Text(categoryModel!.section??""),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            Text("${S.current.suitableFor}: "),
            Expanded(
              child: Text(categoryModel!.gender??"",
              maxLines: 5,
              overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ]
    );
  }
}
