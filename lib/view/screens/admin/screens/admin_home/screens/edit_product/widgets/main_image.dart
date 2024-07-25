import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:image_picker/image_picker.dart";
import "package:shop_app/bloc/admin/edit_product_bloc/edit_product_bloc.dart";
import "package:shop_app/bloc/admin/edit_product_bloc/edit_product_states.dart";

import "../../../../../../../../generated/l10n.dart";
import "../../add_product/widgets/upload_main_image/choose_image_source.dart";
import "../../add_product/widgets/upload_main_image/showImage.dart";

class EditMainImage extends StatelessWidget {
  const EditMainImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProductBloc, EditProductStates>(
        builder: (context, states) =>
            context.read<EditProductBloc>().imageFromNetwork == null &&
                    context.read<EditProductBloc>().updatedImage == null
                ? ChooseImageSource(
                    title: S.current.uploadMainImage,
                    cameraFunction: () => context
                        .read<EditProductBloc>()
                        .pickMainImage(ImageSource.camera)
                        .then(
                          (value) => Navigator.of(context).pop(),
                        ),
                    galleryFunction: () => context
                        .read<EditProductBloc>()
                        .pickMainImage(ImageSource.gallery)
                        .then(
                          (value) => Navigator.of(context).pop(),
                        ),
                  )
                : ShowImage(
                    imageUrl: context.read<EditProductBloc>().imageFromNetwork,
                    imageFile: context.read<EditProductBloc>().updatedImage,
                    deleteFunction: () =>
                        context.read<EditProductBloc>().deleteMainImage(),
                  ));
  }
}
