import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../bloc/admin/material_informations_bloc/material_information_bloc.dart';
import '../../../../../../../bloc/admin/material_informations_bloc/material_informations_states.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../../resources/values_manager.dart';
import '../../../../../signup/widgets/name.dart';
import 'addMaterialField.dart';

class MaterialInformations extends StatelessWidget {
  const MaterialInformations({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialInformationBloc, MaterialInformationStates>(
      builder: (context, states) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            horizontal: PaddingManager.pInternalPadding, vertical: 10),
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
              const Icon(Icons.checkroom_rounded, size: 30),
              const SizedBox(width: SizeManager.sSpace),
              Text(
                S.current.materialInformations,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          SizedBox(
            height:
                context.read<MaterialInformationBloc>().materialOptions.length *
                    21,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 4),
              itemBuilder: (context, index) => RadioListTile<int>(
                title: Text(context
                    .read<MaterialInformationBloc>()
                    .materialOptions
                    .keys
                    .toList()[index]),
                value: index,
                groupValue:
                    context.read<MaterialInformationBloc>().selectedindex,
                onChanged: (value) {
                  context.read<MaterialInformationBloc>().chooseMaterial(value);
                },
              ),
              itemCount: context
                  .read<MaterialInformationBloc>()
                  .materialOptions
                  .length,
            ),
          ),
          const SizedBox(height: 10),
          Name(
            nameController:
                context.read<MaterialInformationBloc>().materialWashCare,
            title: S.current.washCare,
            readOnly: true,
          ),
          TextButton.icon(
              onPressed: () {
                TextEditingController material = TextEditingController();
                TextEditingController washCare = TextEditingController();
                final formKey = GlobalKey<FormState>();
                showBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => Form(
                          key: formKey,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            height: MediaQuery.of(context).size.height * 0.40,
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
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                      borderRadius: BorderRadius.circular(
                                          SizeManager.borderRadiusOfInputField),
                                    )),
                                const SizedBox(height: 20),
                                AddMaterialField(
                                  materialController: material,
                                  title: S.current.newMaterial,
                                  maxLines: 1,
                                ),
                                const SizedBox(height: SizeManager.sSpace16),
                                AddMaterialField(
                                  materialController: washCare,
                                  maxLines: 2,
                                  title: S.current.washCare,
                                ),
                                const SizedBox(height: SizeManager.sSpace),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: TextButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          context
                                              .read<MaterialInformationBloc>()
                                              .addNewMaterial(
                                                  material.text, washCare.text);
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      child: Text(S.current.addNewMaterial)),
                                )
                              ],
                            ),
                          ),
                        ));
              },
              icon: const Icon(Icons.add_circle_outline_rounded),
              label: Text(S.current.addNewMaterial))
        ]),
      ),
    );
  }
}
