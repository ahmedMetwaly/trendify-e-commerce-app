import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../bloc/admin/color_management_bloc/color_bloc.dart';
import '../../../../../../../bloc/admin/color_management_bloc/color_state.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../../resources/values_manager.dart';
import '../../../../../signup/widgets/name.dart';
import 'color_picker.dart';
import 'images_section.dart';

class ColorsInformation extends StatelessWidget {
  const ColorsInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddColor, ColorStates>(
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
                const Icon(Icons.color_lens_rounded, size: 30),
                const SizedBox(width: SizeManager.sSpace),
                Text(
                  S.current.colorsInformation,
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
                     index==0? const SizedBox(height: 20,): Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                            onPressed: () =>
                                context.read<AddColor>().deleteColor(index),
                            icon: const Icon(Icons.delete),
                            label: Text(S.current.deleteThisColor)),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Name(
                              nameController:
                                  context.read<AddColor>().colorsCode[index],
                              title: S.current.colorCode,
                              enabled: false,
                            ),
                          ),
                          const SizedBox(width: 10),
                          ColorPickerPage(index: index),
                        ],
                      ),
                      const SizedBox(height: SizeManager.sSpace),
                      Name(
                        nameController:
                            context.read<AddColor>().colorsName[index],
                        title: S.current.colorName,
                        enabled: false,
                      ),
                      const SizedBox(height: SizeManager.sSpace),
                      ImagesSection(
                        index: index,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: context.read<AddColor>().colorsCode.length),
            const SizedBox(height: SizeManager.sSpace16),
            TextButton.icon(
                onPressed: () => context.read<AddColor>().addNewColor(),
                icon: const Icon(Icons.add_circle_outline_rounded),
                label: Text(S.current.addNewColor))
          ],
        ),
      ),
    );
  }
}
