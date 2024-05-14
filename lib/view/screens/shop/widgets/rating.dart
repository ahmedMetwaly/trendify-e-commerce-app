import "package:flutter/material.dart";
import "package:flutter_rating_bar/flutter_rating_bar.dart";

import "../../../../resources/values_manager.dart";

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.value,
    required this.commentsNum,
  });
  final double value;
  final int commentsNum;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 5,
          child: RatingBar.builder(
            initialRating: value * (5 / 100),
            direction: Axis.horizontal,
            textDirection: TextDirection.rtl,
            allowHalfRating: true,
            minRating: value * (5 / 100),
            maxRating: value * (5 / 100),
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
              //size: 4.0,
            ),
            itemSize: SizeManager.sIconSize,
            unratedColor:
                Theme.of(context).colorScheme.outline.withOpacity(0.5),
            onRatingUpdate: (rating) {},
          ),
        ),
        Expanded(
            flex: 3,
            child: LinearProgressIndicator(
              borderRadius:
                  BorderRadius.circular(SizeManager.bottomSheetRadius),
              backgroundColor:
                  Theme.of(context).colorScheme.outline.withOpacity(0.5),
              value: value / 100,
              minHeight: 8,
            )),
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              "${(commentsNum * (value / 100)).round()}",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
