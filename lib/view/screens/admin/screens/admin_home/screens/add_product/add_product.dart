import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:image_picker/image_picker.dart";
import "package:shop_app/bloc/admin/add_product_bloc/add_product_bloc.dart";
import "package:shop_app/bloc/admin/add_product_bloc/add_product_states.dart";
import "package:shop_app/generated/l10n.dart";
import "package:shop_app/resources/values_manager.dart";
import "package:shop_app/view/screens/admin/screens/admin_home/screens/add_product/widgets/stock_information/stock_information.dart";
import "package:shop_app/view/screens/admin/screens/admin_home/screens/add_product/widgets/price_info.dart";
import "../../../../../../../bloc/admin/color_management_bloc/color_bloc.dart";
import "../../../../../../components/dialogs.dart";
import "widgets/add_product_button.dart";
import "widgets/category_informations/category_informations.dart";
import "widgets/colors_information/colors_info.dart";
import "widgets/main_info.dart";
import "widgets/material_inforamtion/material_informations.dart";
import "widgets/size_informations/size_info.dart";
import "widgets/upload_main_image/choose_image_source.dart";
import "widgets/upload_main_image/showImage.dart";

class AddProduct extends StatelessWidget {
  const AddProduct({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final TextEditingController title = TextEditingController();
    final TextEditingController brand = TextEditingController();
    final TextEditingController price = TextEditingController();
    final TextEditingController salePrecentage = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<AddProductBloc, AddProductStates>(
      builder: (BuildContext context, AddProductStates state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.current.addProduct),
            leading: IconButton(
              onPressed: () {
                AddProductButton.clear(context);
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          bottomNavigationBar: AddProductButton(
            formKey: formKey,
            title: title,
            brand: brand,
            price: price,
            salePrecentage: salePrecentage,
            state: state,
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(
              PaddingManager.pMainPadding,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    context.read<AddProductBloc>().image == null
                        ? ChooseImageSource(
                            title: S.current.uploadMainImage,
                            cameraFunction: () => context
                                .read<AddProductBloc>()
                                .pickMainImage(ImageSource.camera)
                                .then(
                              (value) {
                                if (context.read<AddProductBloc>().image !=
                                    null) {
                                  context.read<AddColor>().setTheMainColorImage(
                                      context.read<AddProductBloc>().image!);
                                }
                                Navigator.of(context).pop();
                              },
                            ),
                            galleryFunction: () => context
                                .read<AddProductBloc>()
                                .pickMainImage(ImageSource.gallery)
                                .then(
                              (value) {
                                if (context.read<AddProductBloc>().image !=
                                    null) {
                                  context.read<AddColor>().setTheMainColorImage(
                                      context.read<AddProductBloc>().image!);
                                }
                                Navigator.of(context).pop();
                              },
                            ),
                          )
                        : ShowImage(
                            imageFile: context.read<AddProductBloc>().image!,
                            deleteFunction: () {
                              context.read<AddColor>().deleteImage(
                                  fromNetwork: false,
                                  indexOfImages: 0,
                                  index: 0);
                              context.read<AddProductBloc>().deleteMainImage();
                            },
                          ),
                    context.read<AddProductBloc>().image == null
                        ? Text(
                            S.current.requiredField,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.error),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 25),
                    MainInfo(
                      title: title,
                      brand: brand,
                    ),
                    const SizedBox(height: 25),
                    PriceInfo(price: price, salePrecentage: salePrecentage),
                    const SizedBox(height: 25),
                    const CategoryInformations(),
                    const SizedBox(height: 25),
                    const MaterialInformations(),
                    const SizedBox(height: 25),
                    const ColorsInformation(
                      fromEditpage: false,
                    ),
                    const SizedBox(height: 25),
                    BlocBuilder<AddProductBloc, AddProductStates>(
                      builder: (BuildContext context, AddProductStates state) =>
                          SizeInformations(
                        isChoosed: state is CheckValidatorState
                            ? state.isValid
                            : false,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const StockInformation(),
                  ],
                ),
              ),
            ),
          )),
        );
      },
      listener: (BuildContext context, AddProductStates state) {
        if (state is AddProductLoading) {
          showLoadingDialog(context);
        }
        if (state is AddProductSuccess) {
          AddProductButton.clear(context);
          showSnackBarDialog(
              context: context,
              screen: const AddProduct(),
              title: S.current.productAddedSuccessfully);
        }
        if (state is AddProductError) {
          Navigator.pop(context);
          errorDialog(context, S.current.error, state.error);
        }
      },
    );
  }
}
