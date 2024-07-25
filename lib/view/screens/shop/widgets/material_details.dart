import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../model/admin_models/product_material.dart';
import '../../../../resources/values_manager.dart';

class MaterialDetails extends StatelessWidget {
  const MaterialDetails({super.key, this.productMaterial});

  final ProductMaterial? productMaterial;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      
      title: Text(
        S.current.materialInformations,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.headlineSmall!.fontWeight,
          fontFamily: Theme.of(context).textTheme.headlineSmall!.fontFamily,
        ),
      ),

       /*  trailing: const Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 35,
      ),  */ 
      
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
            Text("${S.current.material}: "),
            Text(productMaterial!.material??""),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            Text("${S.current.washCare}: "),
            Expanded(
              child: Text(productMaterial!.washCare??"",
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
