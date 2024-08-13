import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:hexcolor/hexcolor.dart";
import "package:shop_app/bloc/admin/color_management_bloc/color_bloc.dart";
import "package:shop_app/bloc/admin/color_management_bloc/color_state.dart";
import "package:shop_app/bloc/admin/stock_section_bloc/stock_section_bloc.dart";
import "package:shop_app/bloc/admin/stock_section_bloc/stock_section_states.dart";
import "package:shop_app/bloc/admin/size_management_bloc/size_bloc.dart";
import "package:shop_app/bloc/admin/size_management_bloc/size_state.dart";
import "package:shop_app/model/admin_models/in_storage.dart";
import "package:shop_app/view/screens/admin/screens/add_product/widgets/number_input.dart";

import "../../../../../../../generated/l10n.dart";
import "../../../../../../../resources/values_manager.dart";

class StockInformation extends StatelessWidget {
  const StockInformation({super.key, this.fromEditPage});
  final bool? fromEditPage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          borderRadius: BorderRadius.circular(SizeManager.borderRadius),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          )),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.storage_rounded, size: 30),
            const SizedBox(width: SizeManager.sSpace),
            Text(S.current.inStock,
                style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
        const SizedBox(height: SizeManager.sSpace16),
        BlocBuilder<AddColor, ColorStates>(
          builder: (context, state) => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, colorIndex) =>
                BlocBuilder<AddSize, SizeStates>(
              builder: (context, state) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(context.read<AddColor>().colorsName[colorIndex].text,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontSize: 17, fontWeight: FontWeight.w500)),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: HexColor(
                                "#${context.read<AddColor>().colorsCode[colorIndex].text}")),
                      )
                    ],
                  ),
                  const SizedBox(height: SizeManager.sSpace),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: context.read<AddSize>().availableSizes.length,
                    separatorBuilder: (BuildContext context, int i) =>
                        const SizedBox(height: SizeManager.sSpace),
                    itemBuilder: (BuildContext context, int sizeIndex) {
                      print("colorIndex : $colorIndex");
                      print(
                          "availabe size index : ${context.read<AddSize>().availableSizes.length}");
                      print("sizeIndex : $sizeIndex");
                      print((colorIndex *
                              context.read<AddSize>().availableSizes.length) +
                          sizeIndex);
                      print(context
                              .read<StockSectionBloc>()
                              .productsInStock
                              .length -
                          1);
                      TextEditingController quantity = TextEditingController(
                          text: fromEditPage == true
                              ? (colorIndex *
                                              context
                                                  .read<AddSize>()
                                                  .availableSizes
                                                  .length) +
                                          sizeIndex !=
                                      context
                                          .read<StockSectionBloc>()
                                          .productsInStock
                                          .length -1
                                  ? context
                                      .read<StockSectionBloc>()
                                      .productsInStock[(colorIndex *
                                              context
                                                  .read<AddSize>()
                                                  .availableSizes
                                                  .length) +
                                          sizeIndex]
                                      .quantity
                                      .toString()
                                  : null
                              : null);
                      return Row(
                        children: [
                          const SizedBox(width: 5),
                          Expanded(
                            flex: 1,
                            child: Text(
                              context.read<AddSize>().availableSizes[sizeIndex],
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: SizeManager.sSpace),
                          BlocBuilder<StockSectionBloc, StockSectionStates>(
                            builder: (BuildContext context,
                                    StockSectionStates state) =>
                                Expanded(
                              flex: 6,
                              child: NumberInput(
                                controller: quantity,
                                label: S.current.quantity,
                                onEditingComplete: (value) {
                                  context
                                      .read<StockSectionBloc>()
                                      .addProductInStock(
                                        (colorIndex *
                                                context
                                                    .read<AddSize>()
                                                    .availableSizes
                                                    .length) +
                                            sizeIndex,
                                        ProductInStock(
                                            color: context
                                                .read<AddColor>()
                                                .colorsCode[colorIndex]
                                                .text,
                                            quantity: int.parse(
                                                quantity.text.isEmpty
                                                    ? '0'
                                                    : quantity.text),
                                            size: context
                                                .read<AddSize>()
                                                .availableSizes[sizeIndex]),
                                      );
                                  print((colorIndex *
                                          context
                                              .read<AddSize>()
                                              .availableSizes
                                              .length) +
                                      sizeIndex);
                                },
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) =>
                const SizedBox(height: SizeManager.sSpace16),
            itemCount: context.read<AddColor>().colorsCode.length,
          ),
        )
      ]),
    );
  }
}
