import "package:flutter/material.dart";

import "../../resources/string_manager.dart";
import "../../resources/values_manager.dart";

class SectionBar extends StatelessWidget {
  const SectionBar({
    super.key,
    required this.goto,
    required this.title,
    required this.slogan,
  });
  final String goto;
  final String title;
  final String slogan;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: PaddingManager.pMainPadding,
          right: PaddingManager.pMainPadding,
          top: PaddingManager.p12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 23,
                  ),
                ),
                Text(
                  slogan,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(goto);
                  },
                  child: const Text(StringManager.viewAll)),
            ),
          )
        ],
      ),
    );
  }
}
