import 'package:flutter/material.dart';

class ImageFromNetwork extends StatelessWidget {
  const ImageFromNetwork({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
    this.fit,
  });

  final String imagePath;
  final double width;
  final double height;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
          ),
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
    );
  }
}
