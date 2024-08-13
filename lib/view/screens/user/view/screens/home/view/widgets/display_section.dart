import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/generated/l10n.dart';
import 'package:shop_app/view/screens/user/view/screens/home/bloc/section_bloc.dart';
import 'package:shop_app/view/screens/user/view/screens/home/bloc/section_states.dart';
import '../../../../../../../../resources/values_manager.dart';
import '../../../../../../../components/product_item.dart';
import '../../../../../../../components/section_bar.dart';

class DisplaySection extends StatelessWidget {
  const DisplaySection({
    super.key,
    required this.sectionTitle,
    required this.sectionSlogan,
    required this.sectionRoute,
  });
  final String sectionTitle;
  final String sectionSlogan;
  final String sectionRoute;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionBar(
          title: sectionTitle,
          slogan: sectionSlogan,
          goto: sectionRoute,
        ),
        Container(
          height: SizeManager.sectionSize,
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingManager.pMainPadding,
              vertical: PaddingManager.p10),
          child: SectionProducts(
            sectionTitle: sectionTitle,
          ),
        ),
      ],
    );
  }
}

class SectionProducts extends StatelessWidget {
  const SectionProducts({
    super.key,
    required this.sectionTitle,
  });
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionBloc, SectionStates>(
      builder: (BuildContext context, SectionStates state) {
        if (state is InitialSectionState) {
          context.read<SectionBloc>().getProducts();
        }
        if (state is LoadingSectionState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ErrorSectionState) {
          return Center(
              child: Column(children: [
            IconButton(
                onPressed: () async {
                  await context.read<SectionBloc>().getProducts();
                },
                icon: Icon(
                  Icons.refresh_rounded,
                  color: Theme.of(context).colorScheme.primary,
                )),
                            Text(S.current.retry),

          ]));
        }
        if (state is SuccessSectionState) {
          return ListView.separated(
            itemBuilder: (context, index) => ProductItem(
              product: sectionTitle == S.current.sNew
                  ? context.read<SectionBloc>().newProducts[index]
                  : context.read<SectionBloc>().onSaleProducts[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemCount: sectionTitle == S.current.sNew
                ? context.read<SectionBloc>().newProducts.length
                : context
                    .read<SectionBloc>()
                    .onSaleProducts
                    .length /* context.read<SectionBloc>().products.length */,
            scrollDirection: Axis.horizontal,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
