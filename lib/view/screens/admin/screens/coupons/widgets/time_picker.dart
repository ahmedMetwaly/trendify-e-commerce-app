import 'package:flutter/material.dart';
import 'package:shop_app/repositeries/time/time_repo.dart';

import '../../../../../../generated/l10n.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget(
      {super.key, required this.label, required this.controller});
  final String label;
  final TextEditingController controller;
  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  Future _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        HandlingTime handleTime = HandlingTime(time: picked.toString());
        String result = handleTime.handleTime();
        widget.controller.text = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: _pickTime,
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
            Icons.timelapse_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
          label: Text(widget.label)),
    );
  }
}
