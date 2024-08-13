import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../../../../resources/values_manager.dart';

class Comment extends StatelessWidget {
  const Comment({
    super.key,
    required this.username,
    required this.commentRank,
    required this.content,
  });
  final String username;
  final String commentRank;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(SizeManager.borderRadius),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.outline,
              blurRadius: SizeManager.sBlurRadius,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            username,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          RatingBar.builder(
            initialRating: double.parse(commentRank),
            direction: Axis.horizontal,
            allowHalfRating: true,
            minRating: double.parse(commentRank),
            maxRating: double.parse(commentRank),
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
          Text(content),
        ],
      ),
    );
  }
}
