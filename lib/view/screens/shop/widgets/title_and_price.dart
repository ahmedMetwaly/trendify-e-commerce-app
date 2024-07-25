import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/view_model/bloc/app_states.dart';
import 'package:shop_app/view_model/bloc/product_view_model.dart';

import '../../../../resources/values_manager.dart';
import '../../../components/label.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    super.key,
    required this.title,
    required this.brandName,
    required this.retailPrice,
    required this.salePrice,
    required this.salePrecentage,
  });

  final String title;
  final String brandName;
  final String retailPrice;
  final String salePrice;
  final String salePrecentage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingManager.pMainPadding),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.surface,
            fontWeight: FontWeight.w800),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(
                  brandName,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                BlocConsumer<ProductViewModel, AppStates>(
                  builder: (BuildContext context, AppStates state) {
                    ProductViewModel viewModel = ProductViewModel.get(context);
                    return Row(
                      children: [
                        RatingBar.builder(
                          initialRating: double.parse(viewModel.reviews
                                  ?.commentsOverview?.commentRankAverage ??
                              "0"),
                          minRating: double.parse(viewModel.reviews
                                  ?.commentsOverview?.commentRankAverage ??
                              "0"),
                          maxRating: double.parse(viewModel.reviews
                                  ?.commentsOverview?.commentRankAverage ??
                              "0"),
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemSize: SizeManager.sIconSize,
                          onRatingUpdate: (rating) {},
                        ),
                        Text(
                          "(${viewModel.reviews?.commentsOverview?.commentRankAverage})",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    );
                  },
                  listener: (BuildContext context, AppStates state) {},
                ),
              ],
            )),
            const SizedBox(
              width: PaddingManager.p10,
            ),
            Row(
              children: [
                Column(children: [
                  salePrecentage != "0"
                      ? Text(
                          "$salePrice\$",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        )
                      : const SizedBox(),
                  Text(
                    "$retailPrice\$",
                    style: salePrecentage == "0"
                        ? Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary)
                        : TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Theme.of(context).colorScheme.outline),
                  ),
                ]),
                const SizedBox(
                  width: PaddingManager.p10,
                ),
               salePrecentage != "0"
                    ? Label(
                        labelTitle: "-$salePrecentage%",
                        color: Theme.of(context).colorScheme.primary)
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
