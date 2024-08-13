import 'package:flutter/material.dart';
import 'package:shop_app/bloc/authentication/auth_bloc.dart';
import 'package:shop_app/generated/l10n.dart';
import 'package:shop_app/resources/routes.dart';
import '../../../../../../../../resources/values_manager.dart';
import '../../../../../../../components/product_item.dart';
import '../../../../../../../components/section_bar.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionBar(
          title: S.current.recommendedForYou,
          slogan: "",
          goto: Routes.history,
        ),
        Container(
            height: SizeManager.sectionSize,
            padding: const EdgeInsets.symmetric(
                horizontal: PaddingManager.pMainPadding,
                vertical: PaddingManager.p10),
            child: ListView.separated(
              itemBuilder: (context, index) => ProductItem(
                product: AuthenticationBloc.user.history![index],
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 15),
              itemCount: AuthenticationBloc.user.history!
                  .length /* context.read<SectionBloc>().products.length */,
              scrollDirection: Axis.horizontal,
            ))
      ],
    );
  }
}
