import 'package:flutter/material.dart';

import '../../../../resources/values_manager.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.sectionLabel,
    required this.sectionImagePath, required this.onPressed,
  });
  final String sectionLabel;
  final String sectionImagePath;
final Function onPressed;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: ()=>onPressed(),
      child: Container(
        height: size.height * .15,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(SizeManager.borderRadius),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.outline,
                blurRadius: SizeManager.sBlurRadius,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: PaddingManager.pInternalPadding,
                    top: PaddingManager.pInternalPadding,
                    bottom: PaddingManager.pInternalPadding),
                child: Text(
                  sectionLabel,
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(SizeManager.borderRadius),
                    bottomRight: Radius.circular(SizeManager.borderRadius)),
                child: Image.asset(
                  sectionImagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
