import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/category_bloc/category_states.dart';
import '../../../../../../../bloc/admin/category_bloc/category_bloc.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../../resources/values_manager.dart';
import '../material_inforamtion/addMaterialField.dart';
import 'category_field.dart';
import 'upload_category_image.dart';

class CategoryInformations extends StatelessWidget {
  const CategoryInformations({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            horizontal: PaddingManager.pInternalPadding, vertical: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            borderRadius: BorderRadius.circular(SizeManager.borderRadius),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
            )),
        child: BlocBuilder<CategoryBloc, CategoryStates>(
          builder: (BuildContext context, CategoryStates state) =>
              Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.category_rounded, size: 30),
                const SizedBox(width: SizeManager.sSpace),
                Text(
                  S.current.categoryInformations,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: SizeManager.sSpace),
            CategoryField(
              title: S.current.gender,
              value: context.read<CategoryBloc>().gender,
              items: context.read<CategoryBloc>().genderOptions,
              hint: S.current.selectAGender,
              onChanged: (newValue) =>
                  context.read<CategoryBloc>().changeGenderOption(newValue),
            ),
            const SizedBox(height: SizeManager.sSpace),
            CategoryField(
              title: S.current.section,
              value: context.read<CategoryBloc>().sectionOption,
              items: context.read<CategoryBloc>().sectionOptions,
              hint: S.current.selectASection,
              onChanged: (newValue) =>
                  context.read<CategoryBloc>().changeSectionOption(newValue),
            ),
            const SizedBox(height: SizeManager.sSpace),
            const UplaodCategoryImage(),
            const SizedBox(height: SizeManager.sSpace),
            TextButton.icon(
                onPressed: () {
                  TextEditingController section = TextEditingController();
                  final formKey = GlobalKey<FormState>();
                  showBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => Form(
                            key: formKey,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 30),
                              height: MediaQuery.of(context).size.height * 0.30,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    materialController: section,
                                    title: S.current.newSection,
                                    maxLines: 1,
                                  ),
                                  const SizedBox(height: SizeManager.sSpace),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            context
                                                .read<CategoryBloc>()
                                                .addNewSection(section.text);

                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: Text(S.current.addNewSection)),
                                  )
                                ],
                              ),
                            ),
                          ));
                },
                icon: const Icon(Icons.add_circle_outline_rounded),
                label: Text(S.current.addNewSection))
          ]),
        ));
  }
}
