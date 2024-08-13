import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/bloc/admin/add_product_bloc/add_product_bloc.dart';
import 'package:shop_app/bloc/admin/add_product_bloc/add_product_states.dart';
import 'package:shop_app/view/screens/admin/screens/add_product/widgets/upload_main_image/choose_image_source.dart';
import 'package:shop_app/view/screens/admin/screens/add_product/widgets/upload_main_image/showImage.dart';
import '../../../../../../../generated/l10n.dart';

class UploadMainImage extends StatelessWidget {
  const UploadMainImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductBloc, AddProductStates>(
        builder: (context, state) =>
            context.read<AddProductBloc>().image == null
                ? ChooseImageSource(
                  title: S.current.uploadMainImage,
                    cameraFunction: () => context
                        .read<AddProductBloc>()
                        .pickMainImage(ImageSource.camera)
                        .then(
                          (value) => Navigator.of(context).pop(),
                        ),
                    galleryFunction: () => context
                        .read<AddProductBloc>()
                        .pickMainImage(ImageSource.gallery)
                        .then(
                          (value) => Navigator.of(context).pop(),
                        ),
                  )
                : ShowImage(
                    imageFile: context.read<AddProductBloc>().image!,
                    deleteFunction: () =>
                        context.read<AddProductBloc>().deleteMainImage(),
                  ));
  }
}