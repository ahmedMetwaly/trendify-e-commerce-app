import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/view_model/bloc/app_states.dart';
import 'package:shop_app/view_model/bloc/cart_view_model.dart';

import '../../../../resources/string_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../components/elevated_button.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    super.key,
    required this.id,
    required this.goodSn,
    required this.sku,
  });
  final int id;
  final String goodSn;
  final String sku;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, AppStates>(
      builder: (BuildContext context, AppStates state) {
        final viewModel = CartBloc.get(context);
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
                title: viewModel.products.any((element) => element["id"] == id)
                    ? StringManager.addedToCart.toUpperCase()
                    : StringManager.addToCart.toUpperCase(),
                color: viewModel.products.any((element) => element["id"] == id)
                    ? Theme.of(context).colorScheme.outline
                    : Theme.of(context).colorScheme.primary,
                onPress: () {
                  if (viewModel.products
                      .any((element) => element["id"] == id)) {
                    print("found");
                  } else {
                    viewModel.addProduct(id, goodSn, sku);
                    print("added");
                  }
                }));
      },
    );
  }
}
