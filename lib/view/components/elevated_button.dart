import 'package:flutter/material.dart';
import 'package:shop_app/resources/values_manager.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({super.key, required this.title, required this.onPress});
  final String title;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onPress(),
      child: Container(
        padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            
            borderRadius: BorderRadius.circular(SizeManager.sBorderRadius),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.onPrimary,
                blurRadius: SizeManager.sBlurRadius,
                offset: SizeManager.boxShadowOffset,
              )
            ]),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
      ),
    );
  }
}
