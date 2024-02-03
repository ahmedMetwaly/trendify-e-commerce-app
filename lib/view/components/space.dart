import "package:flutter/material.dart";

import "../../resources/values_manager.dart";

class Space extends StatelessWidget {
  const Space({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: SizeManager.sSpace);
  }
}
