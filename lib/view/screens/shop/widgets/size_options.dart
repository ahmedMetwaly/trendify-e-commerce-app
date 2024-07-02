import 'package:flutter/material.dart';
import 'package:shop_app/resources/string_manager.dart';
import 'package:shop_app/resources/values_manager.dart';
import 'package:shop_app/view/components/space.dart';

class SizeOption extends StatefulWidget {
  const SizeOption(
      {super.key, required this.availableSizes, required this.sizesDetails});
  final List availableSizes;
  final List sizesDetails;

  @override
  State<SizeOption> createState() => _SizeOptionsState();
}

class _SizeOptionsState extends State<SizeOption> {
  late final List<bool> _selectedSizes;
  int? selectedIndex;
  String? measureUnit = "inch";
  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedSizes =
          List.generate(widget.availableSizes.length, (index) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: PaddingManager.pMainPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text(StringManager.size, style: theme.textTheme.headlineSmall),
              const SizedBox(
                width: SizeManager.sSpace,
              ),
              widget.availableSizes.isEmpty
                  ? const Text(StringManager.oneSize)
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: PaddingManager.p8),
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.outline.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton(
                        style: theme.textTheme.bodyMedium,
                        borderRadius: BorderRadius.circular(10),
                        items: const [
                          DropdownMenuItem(
                              value: "inch", child: Text(StringManager.inch)),
                          DropdownMenuItem(
                              value: "cm", child: Text(StringManager.cm)),
                        ],
                        onChanged: (String? value) => setState(() {
                          measureUnit = value;
                        }),
                        value: measureUnit,
                      ))
            ],
          ),
          const Space(),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ToggleButtons(
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < _selectedSizes.length; i++) {
                      _selectedSizes[i] = i == index;
                    }
                    selectedIndex = index;
                  });
                },
                borderRadius: const BorderRadius.all(
                    Radius.circular(SizeManager.borderRadius)),
                borderColor: theme.colorScheme.outline,
                selectedBorderColor: theme.colorScheme.primary,
                selectedColor: theme.colorScheme.surface,
                fillColor: theme.colorScheme.onPrimary,
                color: theme.colorScheme.primary,
                constraints: BoxConstraints(
                  minHeight: SizeManager.sizeOptionsHeight,
                  minWidth: MediaQuery.of(context).size.width * 0.12,
                ),
                isSelected: _selectedSizes,
                children: widget.availableSizes
                    .map((size) => Padding(
                          padding: const EdgeInsets.all(
                              PaddingManager.pInternalPadding),
                          child: Text(size),
                        ))
                    .toList(),
              ),
            ),
          ),
          const Space(),
          selectedIndex != null
              ? Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: PaddingManager.pInternalPadding,
                      vertical: PaddingManager.p8),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(SizeManager.borderRadius),
                    color: theme.colorScheme.outline.withOpacity(0.15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(StringManager.productMeasuremnet),
                      const SizedBox(height: PaddingManager.p5),
                      GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          mainAxisExtent: 20,
                        ),
                        children: widget.sizesDetails[selectedIndex!]
                            .map((details) {
                              String measureValue =
                                  "${(double.parse(details.values.first.toString().replaceFirst("inch", "")) * 2.54).round()} cm";
                              return Text(
                                  "${details.keys.first}: ${measureUnit == "inch" ? (details.values.first) : measureValue}",
                                  style: theme.textTheme.bodySmall);
                            })
                            .toList()
                            .cast<Widget>(),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
