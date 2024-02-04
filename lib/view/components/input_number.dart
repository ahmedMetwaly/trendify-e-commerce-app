import "package:flutter/material.dart";
import "package:shop_app/resources/string_manager.dart";


class InputNumber extends StatelessWidget {
  const InputNumber({
    super.key, required this.controller,
  });
 final TextEditingController controller ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.bodyMedium,
      validator: (value) {
        if (value!.isEmpty) {
          return StringManager.requiredField;
        }
        return null;
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: 2, horizontal: 10),
      ),
    );
  }
}
