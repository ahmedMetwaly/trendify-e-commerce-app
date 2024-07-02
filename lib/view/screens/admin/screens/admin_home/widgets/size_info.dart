import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/size_management_bloc/size_bloc.dart';
import 'package:shop_app/bloc/admin/size_management_bloc/size_state.dart';
import 'package:shop_app/view/screens/admin/screens/admin_home/widgets/size_options.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../resources/values_manager.dart';

class SizeInformations extends StatelessWidget {
  const SizeInformations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddSize, SizeStates>(
      builder: (context, state) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            borderRadius: BorderRadius.circular(SizeManager.borderRadius),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
            )),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.summarize_rounded, size: 30),
                const SizedBox(width: SizeManager.sSpace),
                Text(
                  S.current.sizeInformations,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                            onPressed: () =>
                                context.read<AddSize>().deleteSize(index),
                            icon: const Icon(Icons.delete),
                            label: Text(S.current.deleteThisSize)),
                      ),
                      const SizeOptions(),
                      const SizedBox(height: SizeManager.sSpace),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: context.read<AddSize>().availableSizes.length),
            const SizedBox(height: SizeManager.sSpace16),
            TextButton.icon(
                onPressed: () => context.read<AddSize>().addNewSize(""),
                icon: const Icon(Icons.add_circle_outline_rounded),
                label: Text(S.current.addNewSize))
          ],
        ),
      ),
    );
  }
}
