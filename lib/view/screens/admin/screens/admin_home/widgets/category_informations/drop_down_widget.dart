import 'package:flutter/material.dart';
import 'package:shop_app/generated/l10n.dart';

class DropDownButtonWidget extends StatefulWidget {
  const DropDownButtonWidget({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.hint,
  });

  final String? value;
  final List<String>? items;
  final Function onChanged;
  final String hint;

  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonWidgetState();
}

class _DropDownButtonWidgetState extends State<DropDownButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.value,
      icon: const Icon(Icons.arrow_drop_down), // Down arrow icon
      iconSize: 24,
      elevation: 16,
      style: Theme.of(context).textTheme.bodyMedium,
      validator: (value){
        if(value == null || value.isEmpty){
          return S.current.requiredField;
        }

        return null;
      },
      
      onChanged: (String? newValue) => widget.onChanged(newValue),
      items: widget.items!.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      hint: Text(widget.hint),
      padding: const EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
