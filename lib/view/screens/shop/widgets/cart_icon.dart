import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/resources/string_manager.dart';

import '../../../../view_model/bloc/app_states.dart';
import '../../../../view_model/bloc/cart_view_model.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, AppStates>(
      builder: (BuildContext context, AppStates state) {
        final viewModel = CartBloc.get(context);
        return IconButton(
            onPressed: () {
              //TODO:: Goto Bag Screen
            },
            icon: SizedBox(
              width: 47,
              height: 37,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Icon(
                    Icons.shopping_cart_rounded,
                    size: 25,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  Positioned(
                    top: 5,
                    left: 15,
                    child: Container(
                  
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.5, vertical: 0.5),
                        child: Text(
                          viewModel.products.length > 99
                              ? StringManager.plus9
                              : viewModel.products.length.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
