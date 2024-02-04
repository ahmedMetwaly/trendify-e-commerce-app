import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

import "../../resources/image_manager.dart";
import "../../resources/string_manager.dart";
import "../../resources/values_manager.dart";
import "elevated_button.dart";
import "input_number.dart";

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController fromController = TextEditingController();
    final TextEditingController toController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(PaddingManager.pMainPadding),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(
                SizeManager.bottomSheetRadius,
              ),
              topRight: Radius.circular(
                SizeManager.bottomSheetRadius,
              ))),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(ImageManager.indicator,
                  color: Theme.of(context).colorScheme.outline),
              const SizedBox(
                height: SizeManager.sSpace,
              ),
              Text(
                StringManager.filter,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Theme.of(context).colorScheme.surface),
              ),
              Padding(
                padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: PaddingManager.p10),
                      child: Text(
                        StringManager.from,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                    ),
                    Expanded(
                      child: InputNumber(
                        controller: fromController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: PaddingManager.p10, left: PaddingManager.p10),
                      child: Text(
                        StringManager.to,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                    ),
                    Expanded(child: InputNumber(controller: toController)),
                  ],
                ),
              ),
              MyElevatedButton(
                  title: StringManager.submit,
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      //TODO: filter the products results then change the bottom app bar title

                      Navigator.of(context).pop();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
