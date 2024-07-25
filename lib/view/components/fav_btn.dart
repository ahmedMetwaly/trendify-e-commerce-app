import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/stock_bloc/stock_bloc.dart';
import 'package:shop_app/generated/l10n.dart';

import '../../model/admin_models/product.dart';

class ActionBtn extends StatelessWidget {
  const ActionBtn({
    super.key,
    required this.deleteBtn,
this.product
  });
  final bool deleteBtn;
 final Product? product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (deleteBtn) {
          //TODO:: Delete from fav
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(S.current.delete),
                    content: Text(S.current.deleteProduct),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(S.current.cancel)),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            context.read<StockBloc>().deleteProduct(
                             product:   product!);
                            debugPrint("delete product");
                          },
                          child: Text(S.current.delete))
                    ],
                  ));
        } else {
          //TODO:: Save to fav
          debugPrint("save to fav");
        }
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).colorScheme.inversePrimary,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
                offset: const Offset(5, 4),
                blurRadius: 2,
              )
            ]),
        child: Center(
          child: Icon(
            deleteBtn ? Icons.delete : Icons.favorite_border_rounded,
            color: deleteBtn
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline,
          ),
        ),
      ),
    );
  }
}
