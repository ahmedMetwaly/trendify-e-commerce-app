import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:image_picker/image_picker.dart";
import "package:shop_app/bloc/admin/category_bloc/category_bloc.dart";
import "package:shop_app/bloc/admin/category_bloc/category_states.dart";
import "package:shop_app/generated/l10n.dart";
import "package:shop_app/view/screens/admin/screens/add_product/widgets/upload_main_image/showImage.dart";
import "../upload_main_image/choose_image_source.dart";

class UplaodCategoryImage extends StatelessWidget {
  const UplaodCategoryImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryStates>(
      builder: (context, states) => context.read<CategoryBloc>().imageFromNetwork ==
                  null &&
              context.read<CategoryBloc>().updatedImage == null
          ? ChooseImageSource(
              title: S.current.uplaodCategoryImage,
              cameraFunction: () async=> context
                  .read<CategoryBloc>()
                  .pickCategoryImage(ImageSource.camera)
                  .then(
                    (value) => Navigator.of(context).pop(),
                  ),
              galleryFunction: () async=> context
                  .read<CategoryBloc>()
                  .pickCategoryImage(ImageSource.gallery)
                  .then(
                    (value) => Navigator.of(context).pop(),
                  ),
            )
          : ShowImage(
              imageUrl: context.read<CategoryBloc>().imageFromNetwork,
              imageFile: context.read<CategoryBloc>().updatedImage,
              deleteFunction: () => context.read<CategoryBloc>().deleteSizeImage(),
            ),
    );
  }
}
