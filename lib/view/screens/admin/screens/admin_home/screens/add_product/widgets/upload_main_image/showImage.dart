import 'dart:io';

import 'package:flutter/material.dart';

import 'package:shop_app/resources/values_manager.dart';
import 'package:shop_app/view/components/image_from_network.dart';

class ShowImage extends StatelessWidget {
  const ShowImage(
      {super.key, required this.deleteFunction, this.imageFile, this.imageUrl});
  final Function deleteFunction;
  final File? imageFile;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
          child: imageUrl != null
              ? ImageFromNetwork(
                  imagePath: imageUrl!,
                  height: MediaQuery.of(context).size.height * 0.34)
              : Image.file(
                  imageFile!,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    ]);
  }
}
