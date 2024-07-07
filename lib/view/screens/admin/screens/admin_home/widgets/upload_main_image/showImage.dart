import 'dart:io';

import 'package:flutter/material.dart';

import 'package:shop_app/resources/values_manager.dart';


class ShowImage extends StatelessWidget {
  const ShowImage({super.key, required this.deleteFunction,required this.imageFile});
final Function deleteFunction;
final File imageFile ;
  @override
  Widget build(BuildContext context) {
    return  Column(children: [
        Align(
            alignment: Alignment.topRight,
            child: IconButton.outlined(
                onPressed: () => deleteFunction(),
                    
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.primary,
                ))),
        Container(
          height: MediaQuery.of(context).size.height * 0.34,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeManager.borderRadius)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(SizeManager.borderRadius),
            child: Image.file(
              imageFile,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ]);
  }
}
