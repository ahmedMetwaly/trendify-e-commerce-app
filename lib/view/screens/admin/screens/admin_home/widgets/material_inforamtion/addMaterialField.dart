import 'package:flutter/material.dart';
import 'package:shop_app/generated/l10n.dart';

class AddMaterialField extends StatelessWidget {
  const AddMaterialField(
      {super.key,
      required this.materialController,
      required this.title,
      required this.maxLines});
  final TextEditingController materialController;
  final String title;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: materialController,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.current.requiredField;
        }
        return null;
      },
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: Theme.of(context).colorScheme.outline),
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }
}
