
import 'package:flutter/material.dart';

import '../../../../resources/values_manager.dart';
import '../../../components/image_from_network.dart';

class ColorOption extends StatelessWidget {
  const ColorOption({
    super.key,
    required this.colorUrl, required this.onPressed,
  });

  final String colorUrl;
final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onPressed(),
      child: SizedBox(
        width: SizeManager.colorOptionSize,
        height: SizeManager.colorOptionSize,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(SizeManager.colorOptionSize),
          child: ImageFromNetwork(
            imagePath: colorUrl,
            height: SizeManager.colorOptionSize,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
