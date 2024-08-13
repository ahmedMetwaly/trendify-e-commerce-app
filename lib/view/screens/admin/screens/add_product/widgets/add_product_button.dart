import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../bloc/admin/add_product_bloc/add_product_bloc.dart';
import '../../../../../../bloc/admin/add_product_bloc/add_product_states.dart';
import '../../../../../../bloc/admin/category_bloc/category_bloc.dart';
import '../../../../../../bloc/admin/color_management_bloc/color_bloc.dart';
import '../../../../../../bloc/admin/material_informations_bloc/material_information_bloc.dart';
import '../../../../../../bloc/admin/size_management_bloc/size_bloc.dart';
import '../../../../../../bloc/admin/stock_section_bloc/stock_section_bloc.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../model/admin_models/category.dart';
import '../../../../../../model/admin_models/colors_model.dart';
import '../../../../../../model/admin_models/product.dart';
import '../../../../../../resources/values_manager.dart';
import '../../../../../components/elevated_button.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({
    super.key,
    required this.formKey,
    required this.title,
    required this.brand,
    required this.price,
    required this.salePrecentage,
    required this.state,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController title;
  final TextEditingController brand;
  final TextEditingController price;
  final TextEditingController salePrecentage;
  final state;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.outline,
                blurRadius: SizeManager.sBlurRadius,
              )
            ]),
        padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
        height: MediaQuery.of(context).size.height * 0.1,
        child: MyElevatedButton(
            title: S.current.addProduct,
            color: Theme.of(context).colorScheme.primary,
            onPress: () {
              context
                  .read<AddProductBloc>()
                  .checkValidators(context.read<AddSize>().availableSizes);
              if (state is CheckValidatorState) {
                print(state.isValid);
                if (formKey.currentState!.validate()) {
                  print("valid");
                  context.read<AddProductBloc>().sizeImage =
                      context.read<AddSize>().uploadedImage;
                  if (context.read<AddProductBloc>().image != null) {
                    context.read<AddProductBloc>().setProductData(
                          product: Product(
                            title: title.text,
                            brand: brand.text.toUpperCase(),
                            price: price.text,
                            salePrecentage: salePrecentage.text,
                            availableSizes:
                                context.read<AddSize>().availableSizes,
                            material: context
                                .read<MaterialInformationBloc>()
                                .productMaterial,
                            puplishedDate: DateTime.now().toString(),
                            colors: List.generate(
                              context.read<AddColor>().colorsCode.length,
                              (index) => ColorsModel(
                                  colorCode: context
                                      .read<AddColor>()
                                      .colorsCode[index]
                                      .text,
                                  colorName: context
                                      .read<AddColor>()
                                      .colorsName[index]
                                      .text,
                                  imagesfile:
                                      context.read<AddColor>().images[index]),
                            ),
                            category: CategoryModel(
                              gender: context.read<CategoryBloc>().gender,
                              section:
                                  context.read<CategoryBloc>().sectionOption,
                              imageFile:
                                  context.read<CategoryBloc>().uploadedImage,
                            ),
                            productsInStock: context
                                .read<StockSectionBloc>()
                                .productsInStock,
                            productQuantity: context
                                .read<StockSectionBloc>()
                                .getProductquantity()
                                .toString(),
                            reviews: [],
                            mainImage: "",
                            id: "",
                            sizeImage: "",
                          ),
                        );
                  }
                }
              }
            }));
  }

  static void clear(BuildContext context) {
    context.read<AddProductBloc>().image = null;
    context.read<AddProductBloc>().sizeImage = null;
    context.read<AddSize>().availableSizes = [];
    context.read<AddSize>().updatedImage = null;
    context.read<AddSize>().imageFromNetwork = null;
    context.read<AddSize>().uploadedImage = null;
    context.read<AddSize>().sizes = {
      "One Size": false,
      "XS": false,
      "S": false,
      "M": false,
      "L": false,
      "XL": false,
      "XXL": false,
      "XXXL": false
    };

    context.read<MaterialInformationBloc>().selectedindex = 0;
    context.read<AddColor>().colorsCode = [
      TextEditingController(text: ColorTools.colorCode(Colors.red))
    ];
    context.read<AddColor>().colorsName = [
      TextEditingController(text: ColorTools.nameThatColor(Colors.red))
    ];
    context.read<AddColor>().images = [[]];
    context.read<AddColor>().imagesFromNetwork = [[]];
    context.read<AddColor>().deletedImages = [];
    context.read<CategoryBloc>().sectionOption = null;
    context.read<CategoryBloc>().gender = null;
    context.read<CategoryBloc>().gender = null;
    context.read<CategoryBloc>().sectionOption = null;
    context.read<AddProductBloc>().product = Product(
        title: null,
        brand: null,
        price: null,
        salePrecentage: null,
        availableSizes: null,
        material: null,
        puplishedDate: null,
        colors: null,
        category: null);
  }
}
