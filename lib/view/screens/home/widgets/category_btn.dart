import "package:flutter/material.dart";
import "package:shop_app/resources/values_manager.dart";

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
    required this.title,
    required this.onPressed,
  });

  final double height;
  final double width;
  final String imagePath;
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  imagePath,
                ),
                fit: BoxFit.cover)),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
            child: Text(
              title,
              style:
                  Theme.of(context).textTheme.headlineLarge!.copyWith(shadows: [
                Shadow(
                  color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
                  offset: const Offset(5, 4),
                  blurRadius: 2,
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
