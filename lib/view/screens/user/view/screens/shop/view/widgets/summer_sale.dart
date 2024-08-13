import 'package:flutter/material.dart';

import '../../../../../../../../resources/values_manager.dart';

class AdSection extends StatelessWidget {
  const AdSection({
    super.key, required this.title, required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
        final Size size = MediaQuery.of(context).size;

    return Container(
      height:  size.height * .16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeManager.borderRadius),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
             title.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w900),
            ),
            Text(
              subTitle.toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ],
        ),
      ),
    );
  }
}
