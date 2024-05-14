import 'package:flutter/material.dart';

import '../../../../resources/string_manager.dart';
import '../../../../resources/values_manager.dart';

class MaterialDetails extends StatelessWidget {
  const MaterialDetails({super.key, this.materialDetails});

  final List? materialDetails;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        StringManager.material,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.headlineSmall!.fontWeight,
          fontFamily: Theme.of(context).textTheme.headlineSmall!.fontFamily,
        ),
      ),
     /*  trailing: const Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 35,
      ), */
      
      textColor: Theme.of(context).colorScheme.primary,
      collapsedTextColor: Theme.of(context).colorScheme.surface,
      childrenPadding: const EdgeInsets.only(
          right: PaddingManager.pMainPadding,
          left: PaddingManager.pMainPadding,
          top: 0,
          bottom: PaddingManager.pInternalPadding),
      children: materialDetails!
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: PaddingManager.p5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                        "${item.attrName}",
                        style: Theme.of(context).textTheme.bodySmall,
                      )),
                  Expanded(flex: 2, child: Text(item.attrValue ?? "")),
                ],
              ),
            ),
          )
          .toList()
          .cast<Widget>(),
    );
  }
}
