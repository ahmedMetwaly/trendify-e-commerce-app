import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/color_management_bloc/color_state.dart';
import 'package:shop_app/generated/l10n.dart';
import '../../../../../../../../../bloc/admin/color_management_bloc/color_bloc.dart';
import '../../../../../../../../../resources/values_manager.dart';

class PickImages extends StatelessWidget {
  const PickImages({super.key, this.fromNetwork, this.productId, required this.index});
  final bool? fromNetwork;
  final String? productId;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddColor, ColorStates>(
      builder: (BuildContext context, ColorStates state) => GestureDetector(
        onTap: ()  {
        /*   if (fromNetwork == true) {
            await context.read<AddColor>().addImages(
                productId: productId ?? "",
                fromNetwork: true,
                indexOfImages:
                    context.read<AddColor>().imagesFromNetwork.length - 1);
          } else { */
            context.read<AddColor>().pickImages(index);
         // }
        },
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(SizeManager.borderRadius),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.collections_rounded, size: 25),
                const SizedBox(width: SizeManager.sSpace),
                Text(S.current.pickImages,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            )),
      ),
    );
  }
}
