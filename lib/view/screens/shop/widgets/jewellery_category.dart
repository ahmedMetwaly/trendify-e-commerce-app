import "package:flutter/material.dart";

class JewelleryCategory extends StatelessWidget {
  const JewelleryCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text("Jewellery"),
        )
      ],
    );
  }
}
