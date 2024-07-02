import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/color_management_bloc/color_state.dart';

import '../../../../../../../bloc/admin/color_management_bloc/color_bloc.dart';
import '../../../../../../../resources/values_manager.dart';

class PickImages extends StatelessWidget {
  const PickImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddColor, ColorStates>(
      builder: (BuildContext context, ColorStates state) => GestureDetector(
        onTap: () => context.read<AddColor>().pickImages(),
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
                Text("Pick Images",
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            )),
      ),
    );
  }
}
