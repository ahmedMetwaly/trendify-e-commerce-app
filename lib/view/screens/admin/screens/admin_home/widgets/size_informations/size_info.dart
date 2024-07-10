import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/size_management_bloc/size_bloc.dart';
import 'package:shop_app/bloc/admin/size_management_bloc/size_state.dart';
import 'package:shop_app/view/screens/admin/screens/admin_home/widgets/material_inforamtion/addMaterialField.dart';
import 'package:shop_app/view/screens/admin/screens/admin_home/widgets/size_informations/size_options.dart';
import 'package:shop_app/view/screens/admin/screens/admin_home/widgets/size_informations/uploadSizeImage.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../../resources/values_manager.dart';

class SizeInformations extends StatelessWidget {
  const SizeInformations({
    super.key,
    required this.isChoosed,
  });
  final bool isChoosed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddSize, SizeStates>(
      builder: (context, state) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            horizontal: PaddingManager.pInternalPadding, vertical: 10),
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
            const SizeOptions(),
            isChoosed
                ? const SizedBox()
                : Text(
                    S.current.requiredField,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
            const SizedBox(height: SizeManager.sSpace16),
            const UplaodSizeImage(),
            TextButton.icon(
                onPressed: () {
                  TextEditingController size = TextEditingController();
                  final formKey = GlobalKey<FormState>();
                  showBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => Form(
                            key: formKey,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              height: MediaQuery.of(context).size.height * 0.28,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                          SizeManager.bottomSheetRadius),
                                      topRight: Radius.circular(
                                          SizeManager.bottomSheetRadius))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 100,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                        borderRadius: BorderRadius.circular(
                                            SizeManager
                                                .borderRadiusOfInputField),
                                      )),
                                  const SizedBox(height: 20),
                                  AddMaterialField(
                                      materialController: size,
                                      maxLines: 1,
                                      title: S.current.newSize),
                                  const SizedBox(height: SizeManager.sSpace),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            context.read<AddSize>().addNewSize(
                                                size.text.toUpperCase());
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: Text(S.current.addNewSize)),
                                  )
                                ],
                              ),
                            ),
                          ));
                },
                icon: const Icon(Icons.add_circle_outline_rounded),
                label: Text(S.current.addNewSize))
          ],
        ),
      ),
    );
  }
}
