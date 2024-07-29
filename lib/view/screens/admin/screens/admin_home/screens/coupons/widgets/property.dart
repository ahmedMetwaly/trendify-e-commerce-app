import 'package:flutter/material.dart';

import '../../../../../../../../resources/values_manager.dart';

class Property extends StatelessWidget {
  const Property({
    super.key,
    required this.value, required this.propertyName,
  });
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
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(
                fontSize: 18,
                color: Theme.of(context).colorScheme.onPrimary),
        ),
        const SizedBox(width: SizeManager.sSpace),
        Expanded(
            child: Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.surface, fontSize: 15),
        )),
      ],
    );
  }
}
