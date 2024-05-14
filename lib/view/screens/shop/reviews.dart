import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:shop_app/resources/string_manager.dart";
import "package:shop_app/resources/values_manager.dart";
import "package:shop_app/view/screens/shop/widgets/comment.dart";
import "package:shop_app/view_model/bloc/app_states.dart";
import "package:shop_app/view_model/bloc/product_view_model.dart";
import "widgets/rating.dart";

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ProductViewModel, AppStates>(
        builder: (BuildContext context, AppStates state) {
          ProductViewModel viewModel = ProductViewModel.get(context);
          return Padding(
            padding: const EdgeInsets.all(PaddingManager.pMainPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringManager.reting,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: Theme.of(context).colorScheme.surface),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              viewModel.reviews?.commentsOverview
                                      ?.commentRankAverage ??
                                  "",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              "${viewModel.reviews?.commentsOverview?.commentNum} ${StringManager.ratings}",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Rating(
                                    commentsNum: viewModel.reviews
                                            ?.commentsOverview?.commentNum ??
                                        0,
                                    value: double.parse(viewModel
                                            .reviews
                                            ?.commentsOverview
                                            ?.percentOverallFit
                                            ?.trueSize
                                            .toString()
                                            .replaceFirst("%", "")
                                            .trim() ??
                                        "0")),
                                Rating(
                                    commentsNum: viewModel.reviews
                                            ?.commentsOverview?.commentNum ??
                                        0,
                                    value: double.parse(viewModel
                                            .reviews
                                            ?.commentsOverview
                                            ?.percentOverallFit
                                            ?.small
                                            .toString()
                                            .replaceFirst("%", "")
                                            .trim() ??
                                        "0")),
                                Rating(
                                    commentsNum: viewModel.reviews
                                            ?.commentsOverview?.commentNum ??
                                        0,
                                    value: double.parse(viewModel
                                            .reviews
                                            ?.commentsOverview
                                            ?.percentOverallFit
                                            ?.large
                                            .toString()
                                            .replaceFirst("%", "")
                                            .trim() ??
                                        "0")),
                              ],
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  viewModel.reviews?.productComments == null
                      ? const SizedBox()
                      : ListView.separated(
                          padding: const EdgeInsets.only(
                              left: PaddingManager.pInternalPadding,
                              right: PaddingManager.pInternalPadding,
                              bottom: PaddingManager.pInternalPadding),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Comment(
                              username: viewModel.reviews
                                      ?.productComments![index].userName ??
                                  "",
                              commentRank: viewModel.reviews
                                      ?.productComments![index].commentRank
                                      .toString() ??
                                  "",
                              content: viewModel
                                      .reviews?.productComments![index].content
                                      .toString() ??
                                  "",
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                          itemCount: viewModel.reviews!.productComments!.length,
                        ),
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, AppStates state) {},
      ),
    );
  }
}
