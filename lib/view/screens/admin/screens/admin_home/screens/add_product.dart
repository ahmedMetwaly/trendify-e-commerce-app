import "package:flex_color_picker/flex_color_picker.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:shop_app/bloc/admin/add_product_bloc/add_product_bloc.dart";
import "package:shop_app/bloc/admin/add_product_bloc/add_product_states.dart";
import "package:shop_app/bloc/admin/color_management_bloc/color_bloc.dart";
import "package:shop_app/generated/l10n.dart";
import "package:shop_app/model/product.dart";
import "package:shop_app/resources/values_manager.dart";
import "package:shop_app/view/screens/admin/screens/admin_home/widgets/in_stock/in_stock.dart";
import "package:shop_app/view/screens/admin/screens/admin_home/widgets/price_info.dart";
import "package:shop_app/view/screens/admin/screens/admin_home/widgets/upload_main_image/upload_image.dart";
import "../../../../../../bloc/admin/category_bloc/category_bloc.dart";
import "../../../../../../bloc/admin/in_stock_bloc/in_stock_bloc.dart";
import "../../../../../../bloc/admin/material_informations_bloc/material_information_bloc.dart";
import "../../../../../../bloc/admin/size_management_bloc/size_bloc.dart";
import "../../../../../../model/colors_model.dart";
import "../../../../../components/elevated_button.dart";
import "../widgets/category_informations/category_informations.dart";
import "../widgets/colors_information/colors_info.dart";
import "../widgets/main_info.dart";
import "../widgets/material_inforamtion/material_informations.dart";
import "../widgets/size_informations/size_info.dart";

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController title = TextEditingController();
    final TextEditingController brand = TextEditingController();
    final TextEditingController price = TextEditingController();
    final TextEditingController salePrecentage = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<AddProductBloc, AddProductStates>(
      builder: (BuildContext context, AddProductStates state) => Scaffold(
        appBar: AppBar(
          title: Text(S.current.addProduct),
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
                          context.read<AddSize>().image;
                      if (context.read<AddProductBloc>().image != null) {
                        //TODO:: make a product model is the products.length from firebase
                        //TODO:: make a factory number is the factories.length from firebase
                        context.read<AddProductBloc>().setProductData(
                              product: Product(
                                title: title.text,
                                brand: brand.text,
                                price: double.parse(price.text),
                                salePrecentage: double.parse(price.text),
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
                                      imagesfile: context
                                          .read<AddColor>()
                                          .images[index]),
                                ),
                                category:
                                    context.read<CategoryBloc>().categoryModel,
                                productsInStock:
                                    context.read<InStockBloc>().productsInStock,
                              ),
                            );
                      }
                    }
                  }
                })),
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
                  const UploadMainImage(),
                  context.read<AddProductBloc>().image == null
                      ? Text(
                          S.current.requiredField,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.error),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 25),
                  MainInfo(title: title, brand: brand),
                  const SizedBox(height: 25),
                  PriceInfo(price: price, salePrecentage: salePrecentage),
                  const SizedBox(height: 25),
                  const CategoryInformations(),
                  const SizedBox(height: 25),
                  const MaterialInformations(),
                  const SizedBox(height: 25),
                  const ColorsInformation(),
                  const SizedBox(height: 25),
                  BlocBuilder<AddProductBloc, AddProductStates>(
                    builder: (BuildContext context, AddProductStates state) =>
                        SizeInformations(
                      isChoosed:
                          state is CheckValidatorState ? state.isValid : false,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const InStock(),
                ],
              ),
            ),
          ),
        )),
      ),
      listener: (BuildContext context, AddProductStates state) {
        if (state is AddProductLoading) {
          showLoadingDialog(context);
        }
        if (state is AddProductSuccess) {
          clear(context);
        }
      },
    );
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void clear(BuildContext context) {
    context.read<AddProductBloc>().image = null;
    context.read<AddProductBloc>().sizeImage = null;
    /*   title.text = "";
          brand.text = "";
          salePrecentage.text = ""; */
    context.read<AddSize>().availableSizes = [];
    context.read<AddSize>().image = null;
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
    context.read<CategoryBloc>().sectionOption = null;
    context.read<CategoryBloc>().gender = null;
    context.read<CategoryBloc>().categoryModel = null;
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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.green[400],
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            S.current.productAddedSuccessfully,
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
          Icon(Icons.check_circle_rounded,
              color: Theme.of(context).colorScheme.inversePrimary),
        ],
      ),
    ));
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AddProduct()));
  }
}
