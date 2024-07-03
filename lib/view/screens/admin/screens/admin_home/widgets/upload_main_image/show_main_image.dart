import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/add_product_bloc/add_product_states.dart';
import 'package:shop_app/resources/values_manager.dart';

import '../../../../../../../bloc/admin/add_product_bloc/add_product_bloc.dart';

class ShowMainImage extends StatelessWidget {
  const ShowMainImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductBloc, AddProductStates>(
      builder: (BuildContext context, state) => Column(children: [
        Align(
            alignment: Alignment.topRight,
            child: IconButton.outlined(
                onPressed: () =>
                    context.read<AddProductBloc>().deleteMainImage(),
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.primary,
                ))),
        Container(
          height: MediaQuery.of(context).size.height * 0.34,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeManager.borderRadius)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(SizeManager.borderRadius),
            child: Image.file(
              context.read<AddProductBloc>().image!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ]),
    );
  }
}
