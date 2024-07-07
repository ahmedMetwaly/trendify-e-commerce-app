import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:image_picker/image_picker.dart";
import "package:shop_app/bloc/admin/size_management_bloc/size_state.dart";
import "package:shop_app/generated/l10n.dart";
import "package:shop_app/view/screens/admin/screens/admin_home/widgets/upload_main_image/showImage.dart";

import "../../../../../../../bloc/admin/size_management_bloc/size_bloc.dart";
import "../upload_main_image/chooseImageSource.dart";

class UplaodSizeImage extends StatelessWidget {
  const UplaodSizeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddSize, SizeStates>(
      builder: (context, states) => context.read<AddSize>().image == null
          ? ChooseImageSource(
            title: S.current.uploadSizeImage,
                cameraFunction: () => context
                    .read<AddSize>()
                    .pickSizeImage(ImageSource.camera)
                    .then((value) => Navigator.of(context).pop()),
                galleryFunction: () => context
                    .read<AddSize>()
                    .pickSizeImage(ImageSource.gallery)
                    .then((value) => Navigator.of(context).pop()),
              )
          : ShowImage(
              deleteFunction: () => context.read<AddSize>().deleteSizeImage(),
              imageFile: context.read<AddSize>().image!,
            ),
    );
  }
}
