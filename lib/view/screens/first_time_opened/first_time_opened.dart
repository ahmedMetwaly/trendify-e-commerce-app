import "package:flutter/material.dart";
import "package:shop_app/resources/image_manager.dart";
import "../../../generated/l10n.dart";
import "../../../resources/values_manager.dart";
import "widgets/select_language.dart";

class AppStarts extends StatelessWidget {
  const AppStarts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImageManager.splash),
            const SizedBox(height: SizeManager.sSpace16),
            Text(
              S.current.selectLanguage,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: SizeManager.sSpace),
            const MyToggleButtons(),
          ]),
    );
  }
}
