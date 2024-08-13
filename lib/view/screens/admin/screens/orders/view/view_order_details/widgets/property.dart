import 'package:flutter/material.dart';

import '../../../../../../../../resources/values_manager.dart';

class Property extends StatelessWidget {
  const Property({super.key, required this.propertyName, required this.value});
  final String propertyName;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$propertyName : ",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(width: SizeManager.sSpace),
        Expanded(
            child: Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.surface, fontSize: 15),
        )),
      ],
    );
  }
}
