import 'package:flutter/material.dart';



class DropDownButtonWidget extends StatelessWidget {
  const DropDownButtonWidget({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged, required this.hint,
  });

  final String? value;
  final List<String>? items;
  final Function onChanged;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      icon: const Icon(Icons.arrow_drop_down), // Down arrow icon
      iconSize: 24,
      elevation: 16,
      style: Theme.of(context).textTheme.bodyMedium,
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      onChanged: (String? newValue) => onChanged(newValue),
      items: items!.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      hint: Text(hint),
      padding: const EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
