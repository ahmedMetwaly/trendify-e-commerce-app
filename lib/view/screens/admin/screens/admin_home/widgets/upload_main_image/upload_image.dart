import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/bloc/admin/add_product_bloc/add_product_bloc.dart';
import 'package:shop_app/bloc/admin/add_product_bloc/add_product_states.dart';
import 'package:shop_app/view/screens/admin/screens/admin_home/widgets/upload_main_image/show_main_image.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../../resources/values_manager.dart';

class UploadMainImage extends StatelessWidget {
  const UploadMainImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductBloc, AddProductStates>(
        builder: (context, state) => context.read<AddProductBloc>().image ==
                null
            ? GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(50),
                      height: MediaQuery.of(context).size.height * 0.25,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(
                                  SizeManager.bottomSheetRadius),
                              topRight: Radius.circular(
                                  SizeManager.bottomSheetRadius))),
                      child: SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: GestureDetector(
                              onTap: () => context
                                  .read<AddProductBloc>()
                                  .pickMainImage(ImageSource.camera)
                                  .then(
                                    (value) => Navigator.of(context).pop(),
                                  ),
                              child: Container(
                                padding: const EdgeInsets.all(
                                    PaddingManager.pInternalPadding),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  borderRadius: BorderRadius.circular(
                                      SizeManager.borderRadius),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.camera_alt_rounded),
                                    Text(S.current.camera),
                                  ],
                                ),
                              ),
                            )),
                            const SizedBox(width: 25),
                            Expanded(
                                child: GestureDetector(
                              onTap: () => context
                                  .read<AddProductBloc>()
                                  .pickMainImage(ImageSource.gallery).then(
                                    (value) => Navigator.of(context).pop(),
                                  ),
                              child: Container(
                                padding: const EdgeInsets.all(
                                    PaddingManager.pInternalPadding),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  borderRadius: BorderRadius.circular(
                                      SizeManager.borderRadius),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.collections),
                                    Text(S.current.gallery),
                                  ],
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.34,
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withOpacity(0.2),
                        borderRadius:
                            BorderRadius.circular(SizeManager.borderRadius),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline,
                        )),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.image, size: 40),
                          const SizedBox(height: SizeManager.sSpace),
                          Text(S.current.uploadMainImage,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary))
                        ])))
            : const ShowMainImage());
  }
}
