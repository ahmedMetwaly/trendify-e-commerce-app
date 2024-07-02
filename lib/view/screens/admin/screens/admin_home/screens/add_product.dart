import "package:flutter/material.dart";

import "package:shop_app/generated/l10n.dart";
import "package:shop_app/resources/values_manager.dart";
import "package:shop_app/view/screens/admin/screens/admin_home/widgets/price_info.dart";
import "package:shop_app/view/screens/admin/screens/admin_home/widgets/upload_images.dart";

import "../../../../../components/elevated_button.dart";
import "../widgets/colors_information/colors_info.dart";
import "../widgets/main_info.dart";
import "../widgets/size_info.dart";

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController title = TextEditingController();
    final TextEditingController brand = TextEditingController();
    final TextEditingController price = TextEditingController();
    final TextEditingController salePrecentage = TextEditingController();

    final formKey = GlobalKey<FormState>();
    //List<ProductSize>? size;
    /*ProductMaterial? material;
  Description? description;
  final TextEditingController shippingTerms= TextEditingController();
  List<Review>? reviews;
  List<TextEditingController>? colors;
  Category? category;
  List<ProductInStock>? productsInStock;
 */
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.addProduct),
      ),
      bottomNavigationBar: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
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
                      //TODO:: add product to database
                    })),
          );
        }
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
                const UploadImages(),
                const SizedBox(height: 25),
                MainInfo(title: title, brand: brand),
                const SizedBox(height: 25),
                PriceInfo(price: price, salePrecentage: salePrecentage),
                const SizedBox(height: 25),
                const ColorsInformation(),
                const SizedBox(height: 25),
                const SizeInformations(),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
