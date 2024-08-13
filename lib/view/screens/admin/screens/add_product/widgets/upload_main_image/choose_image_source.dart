import 'package:flutter/material.dart';

import '../../../../../../../generated/l10n.dart';
import '../../../../../../../resources/values_manager.dart';

class ChooseImageSource extends StatelessWidget {
  const ChooseImageSource({
    super.key,
    required this.cameraFunction,
    required this.galleryFunction,
    required this.title,
  });

  final Function cameraFunction;
  final Function galleryFunction;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => Container(
              padding: const EdgeInsets.all(50),
              height: MediaQuery.of(context).size.height * 0.25,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(SizeManager.bottomSheetRadius),
                      topRight:
                          Radius.circular(SizeManager.bottomSheetRadius))),
              child: SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () => cameraFunction(),
                      child: Container(
                        padding: const EdgeInsets.all(
                            PaddingManager.pInternalPadding),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary),
                          borderRadius:
                              BorderRadius.circular(SizeManager.borderRadius),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.camera_alt_rounded),
                            Text(S.current.camera),
                          ],
                        ),
                      ),
                    )),
                    const SizedBox(width: 25),
                    Expanded(
                        child: GestureDetector(
                      onTap: () => galleryFunction(),
                      child: Container(
                        padding: const EdgeInsets.all(
                            PaddingManager.pInternalPadding),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary),
                          borderRadius:
                              BorderRadius.circular(SizeManager.borderRadius),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.collections),
                            Text(S.current.gallery),
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          );
        },
        child: title == S.current.uploadMainImage
            ? Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.34,
                decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.outline.withOpacity(0.2),
                    borderRadius:
                        BorderRadius.circular(SizeManager.borderRadius),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                    )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.image, size: 40),
                      const SizedBox(height: SizeManager.sSpace),
                      Text(title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary))
                    ]))
            : Container(
                width: double.infinity,
                padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
                decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    borderRadius:
                        BorderRadius.circular(SizeManager.borderRadius),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.image_rounded, size: 25),
                    const SizedBox(width: SizeManager.sSpace),
                    Text(
                        title == S.current.uplaodCategoryImage
                            ? S.current.uplaodCategoryImage
                            : S.current.uploadSizeImage,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                )));
  }
}
