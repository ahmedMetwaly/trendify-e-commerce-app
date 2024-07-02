import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../bloc/admin/color_management_bloc/color_bloc.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({
    super.key,
    required this.index,
  });
  final int index;
  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  late Color dialogPickerColor; // Color for picker in dialog using onChanged
  @override
  void initState() {
    dialogPickerColor = Colors.red;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(ColorTools.colorCode(dialogPickerColor) +
        ColorTools.nameThatColor(dialogPickerColor));
    return ColorIndicator(
      width: 44,
      height: 44,
      borderRadius: 4,
      color: dialogPickerColor,
      onSelectFocus: false,
      onSelect: () async {
        // Store current color before we open the dialog.
        final Color colorBeforeDialog = dialogPickerColor;
        // Wait for the picker to close, if dialog was dismissed,
        // then restore the color we had before it was opened.
        if (!(await colorPickerDialog())) {
          setState(() {
            dialogPickerColor = colorBeforeDialog;
            context.read<AddColor>().colorsCode[widget.index].text =
                ColorTools.colorCode(dialogPickerColor);
            context.read<AddColor>().colorsName[widget.index].text =
                ColorTools.nameThatColor(dialogPickerColor);
          });
        }
      },
    );
  }

  Future<bool> colorPickerDialog() async {
    return ColorPicker(
      color: dialogPickerColor,
      onColorChanged: (Color color) => setState(() {
        dialogPickerColor = color;
        context.read<AddColor>().colorsCode[widget.index].text =
            ColorTools.colorCode(dialogPickerColor);
        context.read<AddColor>().colorsName[widget.index].text =
            ColorTools.nameThatColor(dialogPickerColor);
      }),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorCodeTextStyle: Theme.of(context).textTheme.bodyMedium,
      colorCodePrefixStyle: Theme.of(context).textTheme.bodySmall,
      selectedPickerTypeColor: Theme.of(context).colorScheme.primary,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
    ).showPickerDialog(
      context,
      actionsPadding: const EdgeInsets.all(16),
      constraints:
          const BoxConstraints(minHeight: 480, minWidth: 300, maxWidth: 320),
    );
  }
}
