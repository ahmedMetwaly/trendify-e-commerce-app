import "package:flutter/material.dart";
import "package:shop_app/resources/colors_manager.dart";
import "package:shop_app/resources/string_manager.dart";

class Email extends StatefulWidget {
  const Email({
    super.key,
    required this.inputController,
  });
  final TextEditingController inputController;
  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  @override
  Widget build(BuildContext context) {
    IconData emailChecker = Icons.email_rounded;

    return TextFormField(
      controller: widget.inputController,
      keyboardType: TextInputType.emailAddress,
      style: Theme.of(context).textTheme.bodyMedium,
      validator: (value) {
        if (value!.isEmpty) {
          return StringManager.requiredField;
        } else if (!value.contains("@")) {
          return StringManager.notValidEmail;
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          emailChecker = Icons.check;
        });
      },
      decoration: InputDecoration(
        suffixIcon: Icon(emailChecker, color: ColorsManager.success),
        labelText: StringManager.email,
      ),
    );
  }
}
