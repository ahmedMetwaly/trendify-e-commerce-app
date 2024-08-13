import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/edit_product_bloc/edit_product_bloc.dart';
import 'package:shop_app/bloc/admin/edit_product_bloc/edit_product_states.dart';
import 'package:shop_app/bloc/admin/stock_bloc/stock_bloc.dart';
import 'package:shop_app/bloc/admin/stock_section_bloc/stock_section_bloc.dart';
import 'package:shop_app/generated/l10n.dart';
import 'package:shop_app/model/admin_models/product.dart';
import 'package:shop_app/resources/values_manager.dart';
import 'package:shop_app/view/screens/admin/screens/add_product/widgets/category_informations/category_informations.dart';
import '../../../../../bloc/admin/category_bloc/category_bloc.dart';
import '../../../../../bloc/admin/color_management_bloc/color_bloc.dart';
import '../../../../../bloc/admin/material_informations_bloc/material_information_bloc.dart';
import '../../../../../bloc/admin/size_management_bloc/size_bloc.dart';
import '../../../../../model/admin_models/category.dart';
import '../../../../../model/admin_models/colors_model.dart';
import '../../../../components/dialogs.dart';
import '../../../../components/elevated_button.dart';
import '../add_product/widgets/colors_information/colors_info.dart';
import '../add_product/widgets/main_info.dart';
import '../add_product/widgets/material_inforamtion/material_informations.dart';
import '../add_product/widgets/price_info.dart';
import '../add_product/widgets/size_informations/size_info.dart';
import '../add_product/widgets/stock_information/stock_information.dart';
import 'widgets/main_image.dart';

class EditProduct extends StatelessWidget {
  const EditProduct({super.key, this.product});
  final Product? product;
  @override
  Widget build(BuildContext context) {
    final TextEditingController title =
        TextEditingController(text: product?.title);
    final TextEditingController brand =
        TextEditingController(text: product?.brand);
    final TextEditingController price =
        TextEditingController(text: product?.price);
    final TextEditingController salePrecentage =
        TextEditingController(text: product?.salePrecentage);
    final formKey = GlobalKey<FormState>();
    product != null ? setInitial(context) : null;
    return BlocConsumer<EditProductBloc, EditProductStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.current.editProduct),
            leading: IconButton(
              onPressed: () {
                clear(context);
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          bottomNavigationBar: Container(
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
                  title: S.current.saveProduct,
                  color: Theme.of(context).colorScheme.primary,
                  onPress: () {
                    context.read<EditProductBloc>().sizeImage =
                        context.read<AddSize>().uploadedImage;
                    context
                        .read<EditProductBloc>()
                        .deletedImages
                        .addAll(context.read<AddColor>().deletedImages);
                    if (context.read<AddSize>().availableSizes.isNotEmpty) {
                      if (formKey.currentState!.validate()) {
                        context.read<EditProductBloc>().saveProduct(
                              product: Product(
                                id: product!.id,
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
                                      imagesUrl: context
                                          .read<AddColor>()
                                          .imagesFromNetwork[index],
                                      imagesfile: context
                                          .read<AddColor>()
                                          .images[index]),
                                ),
                                category: CategoryModel(
                                    gender: context.read<CategoryBloc>().gender,
                                    section: context
                                        .read<CategoryBloc>()
                                        .sectionOption),
                                productsInStock: context
                                    .read<StockSectionBloc>()
                                    .productsInStock,
                                productQuantity: context
                                    .read<StockSectionBloc>()
                                    .getProductquantity()
                                    .toString(),
                                reviews: [],
                                mainImage: product!.mainImage,
                                sizeImage: product!.sizeImage,
                              ),
                            );
                      }
                    }
                  })),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(PaddingManager.pMainPadding),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(children: [
                  const EditMainImage(),
                  context.read<EditProductBloc>().imageFromNetwork == null &&
                          context.read<EditProductBloc>().updatedImage == null
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
                  ColorsInformation(
                    fromEditpage: true,
                    id: product?.id ?? "",
                  ),
                  const SizedBox(height: 25),
                  SizeInformations(
                    isChoosed: context.read<AddSize>().availableSizes.isEmpty
                        ? false
                        : true,
                  ),
                  const SizedBox(height: 25),
                  const StockInformation(fromEditPage: true),
                ]),
              ),
            ),
          )),
        );
      },
      listener: (BuildContext context, state) {
        if (state is EditProductLoadingState) {
          showLoadingDialog(context);
        }
        if (state is EditProductSuccessState) {
          clear(context);
          showSnackBarDialog(
              context: context, title: S.current.savedSuccessfully);
              context.read<StockBloc>().getBrandProducts(product!.brand!);
        }
        if (state is EditProductFailedState) {
          Navigator.pop(context);
          errorDialog(context, S.current.error, state.errorMessage);
        }
      },
    );
  }

  void setInitial(BuildContext context) {
    context.read<EditProductBloc>().imageFromNetwork = product!.mainImage;
    context.read<CategoryBloc>().gender = product!.category!.gender;
    context.read<CategoryBloc>().sectionOption = product!.category!.section;
    context
        .read<MaterialInformationBloc>()
        .detectIndex(product!.material!.material!);
    print(product!.colors!.length);
    context.read<AddColor>().colorsCode = [];
    context.read<AddColor>().colorsName = [];
    context.read<AddColor>().images = [];
    context.read<AddColor>().imagesFromNetwork = [];
    for (int i = 0; i < product!.colors!.length; i++) {
      context
          .read<AddColor>()
          .colorsCode
          .add(TextEditingController(text: product!.colors![i].colorCode!));
      context
          .read<AddColor>()
          .colorsName
          .add(TextEditingController(text: product!.colors![i].colorName!));
      if (product!.colors![i].imagesUrl != null) {
        context
            .read<AddColor>()
            .imagesFromNetwork
            .add(product!.colors![i].imagesUrl!.toList().cast<String>());
      }
      context.read<AddColor>().images.add([]);
    }
    context.read<AddSize>().detectSizes(product!.availableSizes!);
    context.read<AddSize>().imageFromNetwork = product!.sizeImage!;
    context.read<StockSectionBloc>().productsInStock =
        product!.productsInStock!;
  }

  void clear(BuildContext context) {
    context.read<EditProductBloc>().imageFromNetwork = null;
    context.read<EditProductBloc>().updatedImage = null;
    context.read<EditProductBloc>().deletedImage = null;
    context.read<EditProductBloc>().sizeImage = null;

    context.read<AddSize>().imageFromNetwork = null;
    context.read<AddSize>().uploadedImage = null;
    context.read<AddSize>().availableSizes = [];
    context.read<AddSize>().updatedImage = null;
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

    context.read<CategoryBloc>().sectionOption = null;
    context.read<EditProductBloc>().product = Product(
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
