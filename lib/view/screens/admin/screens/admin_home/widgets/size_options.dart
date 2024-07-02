import 'package:flutter/material.dart';

class SizeOptions extends StatefulWidget {
  const SizeOptions({super.key});

  @override
  State<SizeOptions> createState() => _SizeOptionsState();
}

class _SizeOptionsState extends State<SizeOptions> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        value: _selectedValue,
        items: const [
          DropdownMenuItem(
            value: 'value1',
            child: Text('Option 1'),
          ),
          DropdownMenuItem(
            value: 'value2',
            child: Text('Option 2'),
          ),
        ],
        onChanged: (String? newValue) {
          setState(() {
            _selectedValue = newValue;
          });
          print('Selected value: $_selectedValue');
        },
        hint: const Text('Select an Option'),
      ),
    );
  }
}
