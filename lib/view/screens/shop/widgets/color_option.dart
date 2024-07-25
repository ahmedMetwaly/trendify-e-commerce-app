import 'package:flutter/material.dart';

import '../../../../resources/values_manager.dart';
import 'package:hexcolor/hexcolor.dart';

class ColorOption extends StatelessWidget {
  const ColorOption({
    super.key,
    required this.colorCode,
    required this.colorName,
    required this.onPressed,
  });

  final String colorCode;
  final String colorName;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: SizedBox(
        width: SizeManager.colorOptionSize,
        height: SizeManager.colorOptionSize,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(SizeManager.colorOptionSize),
            child: Container(
              decoration: BoxDecoration(color: HexColor("#$colorCode")),
            )),
      ),
    );
  }
}
