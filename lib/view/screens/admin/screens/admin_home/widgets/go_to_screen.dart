
import 'package:flutter/material.dart';

class GoToScreen extends StatelessWidget {
  const GoToScreen({
    super.key,
    required this.screenRoute,
    required this.title,
  });
  final String screenRoute;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).pushNamed(screenRoute),
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary)),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
