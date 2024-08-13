/* import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:image_picker/image_picker.dart";
import "package:shop_app/bloc/admin/size_management_bloc/size_state.dart";
import "package:shop_app/generated/l10n.dart";
import "package:shop_app/view/screens/admin/screens/admin_home/screens/add_product/widgets/upload_main_image/showImage.dart";

import "../../../../../../../../../bloc/admin/size_management_bloc/size_bloc.dart";
import "../upload_main_image/choose_image_source.dart";

class UplaodSizeImage extends StatelessWidget {
  const UplaodSizeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddSize, SizeStates>(
      builder: (context, states) => context.read<AddSize>().image == null
          ? Builder(
            builder: (context) {
              return ChooseImageSource(
                title: S.current.uploadSizeImage,
                     cameraFunction: () => context
                        .read<AddSize>()
                        .pickSizeImage(ImageSource.camera)
                        .then((value) => Navigator.of(context).pop()),
                    galleryFunction: () => context
                        .read<AddSize>()
                        .pickSizeImage(ImageSource.gallery)
                        .then((value) => Navigator.of(context).pop()),
                   );
            }
          )
          : ShowImage(
              deleteFunction: () => context.read<AddSize>().deleteSizeImage(),
              imageFile: File(context.read<AddSize>().image!.path),
            ),
    );
  }
}
 */
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:image_picker/image_picker.dart";
import "package:shop_app/bloc/admin/size_management_bloc/size_state.dart";
import "package:shop_app/generated/l10n.dart";
import "package:shop_app/view/screens/admin/screens/add_product/widgets/upload_main_image/showImage.dart";

import "../../../../../../../bloc/admin/size_management_bloc/size_bloc.dart";
import "../upload_main_image/choose_image_source.dart";

class UplaodSizeImage extends StatelessWidget {
  const UplaodSizeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddSize, SizeStates>(
      builder: (context, states) => context.read<AddSize>().imageFromNetwork ==
                  null &&
              context.read<AddSize>().updatedImage == null
          ? ChooseImageSource(
              title: S.current.uploadSizeImage,
              cameraFunction: () => context
                  .read<AddSize>()
                  .pickSizeImage(ImageSource.camera)
                  .then(
                    (value) => Navigator.of(context).pop(),
                  ),
              galleryFunction: () => context
                  .read<AddSize>()
                  .pickSizeImage(ImageSource.gallery)
                  .then(
                    (value) => Navigator.of(context).pop(),
                  ),
            )
          : ShowImage(
              imageUrl: context.read<AddSize>().imageFromNetwork,
              imageFile: context.read<AddSize>().updatedImage,
              deleteFunction: () => context.read<AddSize>().deleteSizeImage(),
            ),
    );
  }
}
