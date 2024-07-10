import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:shop_app/bloc/admin/color_management_bloc/color_bloc.dart";
import "package:shop_app/bloc/admin/color_management_bloc/color_state.dart";
import "package:shop_app/bloc/admin/in_stock_bloc/in_stock_bloc.dart";
import "package:shop_app/bloc/admin/in_stock_bloc/in_stock_states.dart";
import "package:shop_app/bloc/admin/size_management_bloc/size_bloc.dart";
import "package:shop_app/bloc/admin/size_management_bloc/size_state.dart";
import "package:shop_app/model/in_storage.dart";
import "package:shop_app/view/screens/admin/screens/admin_home/widgets/number_input.dart";

import "../../../../../../../generated/l10n.dart";
import "../../../../../../../resources/values_manager.dart";

class InStock extends StatelessWidget {
  const InStock({super.key});

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
                            color: Color(0xFF +
                                int.parse(
                                    context
                                        .read<AddColor>()
                                        .colorsCode[colorIndex]
                                        .text,
                                    radix: 16))),
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
                      TextEditingController quantity = TextEditingController();
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
                          BlocBuilder<InStockBloc, InStockStates>(
                            builder:
                                (BuildContext context, InStockStates state) =>
                                    Expanded(
                              flex: 6,
                              child: NumberInput(
                                controller: quantity,
                                label: S.current.quantity,
                                onEditingComplete: (value) {
                                  context.read<InStockBloc>().addProductInStock(
                                        (colorIndex *
                                                context
                                                    .read<AddSize>()
                                                    .availableSizes
                                                    .length)+sizeIndex,
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
