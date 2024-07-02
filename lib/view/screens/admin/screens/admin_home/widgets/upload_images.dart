import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../resources/values_manager.dart';

class UploadImages extends StatelessWidget {
  const UploadImages({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          //TODO:: pickImages
        },
        child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.34,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                borderRadius: BorderRadius.circular(SizeManager.borderRadius),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                )),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.image, size: 40),
              const SizedBox(height: SizeManager.sSpace),
              Text(S.current.uploadMainImage,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Theme.of(context).colorScheme.primary))
            ])));
  }
}
