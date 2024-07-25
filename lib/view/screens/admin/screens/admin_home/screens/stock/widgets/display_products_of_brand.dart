
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../bloc/admin/stock_bloc/stock_bloc.dart';
import '../../../../../../../../model/admin_models/product.dart';
import '../../../../../../../../resources/values_manager.dart';
import '../../../../../../../components/product_item.dart';

class DisplayProductsOfBrand extends StatelessWidget {
  const DisplayProductsOfBrand({
    super.key,
    required this.brandName,
    required this.products,
  });

  final String brandName;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
       await context.read<StockBloc>().getBrandProducts(brandName);
      },
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: PaddingManager.p10,
          childAspectRatio: 0.50,
          mainAxisSpacing: PaddingManager.p10,
        ),
        children: products
            .map((product) => ProductItem(
                  product: product,
                  toEdit: true,
                  boxFit: BoxFit.cover,
                ))
            .toList(),
      ),
    );
  }
}
