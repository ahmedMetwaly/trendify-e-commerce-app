import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';

class NumberInput extends StatelessWidget {
  const NumberInput({super.key, required this.controller, required this.label});
  final TextEditingController controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return S.current.requiredField;
        }
        if (label == S.current.salePrecentage) {
          if (int.parse(value) > 100) {
            return S.current.salePrecentageError;
          }
        }
        return null;
      },
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: label == S.current.salePrecentage
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(" %",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.outline)),
                ],
              )
            : null,
      ),
    );
  }
}
