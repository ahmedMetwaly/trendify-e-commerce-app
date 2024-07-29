import 'package:flutter/material.dart';
import 'package:shop_app/repositeries/date/date_format.dart';

import '../../../../../../../../generated/l10n.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget(
      {super.key, required this.label, required this.controller});
  final String label;
  final TextEditingController controller;
  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  Future _pickDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1));
    if (picked != null) {
      setState(() {
        HandlingDate handleDate = HandlingDate(date: picked.toString());
        String result = handleDate.handleDate();
        widget.controller.text = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: _pickDate,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.current.requiredField;
        }
        return null;
      },
      readOnly: true,
      controller: widget.controller,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.calendar_month_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
          label: Text(widget.label)),
    );
  }
}
