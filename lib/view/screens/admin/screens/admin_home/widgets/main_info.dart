
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../resources/values_manager.dart';
import '../../../../signup/widgets/name.dart';

class MainInfo extends StatelessWidget {
  const MainInfo({
    super.key,
    required this.title,
    required this.brand,
  });

  final TextEditingController title;
  final TextEditingController brand;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
      decoration: BoxDecoration(
          color:
              Theme.of(context).colorScheme.outline.withOpacity(0.2),
          borderRadius:
              BorderRadius.circular(SizeManager.borderRadius),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          )),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.view_quilt_rounded,
                size: 30,
              ),
              const SizedBox(
                width: SizeManager.sSpace,
              ),
              Text(
                S.current.productDetails,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: SizeManager.sSpace16),
          Name(nameController: title, title: S.current.title),
          const SizedBox(height: SizeManager.sSpace16),
          Name(
            nameController: brand,
            title: S.current.brand,
          ),
          const SizedBox(height: SizeManager.sSpace16),
                        
        ],
      ),
    );
  }
}
