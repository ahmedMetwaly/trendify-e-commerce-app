import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../../generated/l10n.dart';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer(this.milliseconds);

  void run(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), callback);
  }
}

class NumberInput extends StatefulWidget {
  const NumberInput(
      {super.key,
      required this.controller,
      required this.label,
      required this.onEditingComplete});
  final TextEditingController controller;
  final String label;
  final Function onEditingComplete;

  @override
  State<NumberInput> createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  final _debouncer = Debouncer(500); // Adjust delay as needed (in milliseconds)

  @override
  void dispose() {
    _debouncer._timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return S.current.requiredField;
        }
        if (widget.label == S.current.salePrecentage) {
          if (int.parse(value) > 100) {
            return S.current.salePrecentageError;
          }
        }
        return null;
      },
      onChanged: (value) =>
          _debouncer.run(() => widget.onEditingComplete(value)),
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: widget.label == S.current.salePrecentage
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
