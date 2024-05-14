import "package:flutter/material.dart";
import "../../resources/string_manager.dart";
import "../../resources/values_manager.dart";
import "bottom_sheet_content.dart";

PreferredSize bottomSheet(
  BuildContext context,
) {
  return PreferredSize(
      preferredSize: const Size.fromHeight(59),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            builder: (btmContext) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const BottomSheetContent(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            color: Theme.of(context).colorScheme.outline.withOpacity(0.15),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.filter_list_rounded),
                    Text(
                      StringManager.filter,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.swap_vert_rounded),
                    Text(
                      StringManager.price,
                    ),
                  ],
                ),
                Icon(Icons.view_comfy_rounded)
              ],
            ),
          ),
        ),
      ));
}
