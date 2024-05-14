import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({super.key, required this.labelTitle, required this.color});
final String labelTitle;
final Color color;
  @override
  Widget build(BuildContext context) {
    return  Container(
           
            padding: const EdgeInsets.symmetric(vertical:8,horizontal: 10),
            decoration: ShapeDecoration(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(29),
              ),
            ),
            child: Center(
              child: Text(labelTitle,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.inversePrimary)),
            ),
          );
  }
}