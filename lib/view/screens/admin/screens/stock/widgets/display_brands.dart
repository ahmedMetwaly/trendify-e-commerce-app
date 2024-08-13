import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../bloc/admin/stock_bloc/stock_bloc.dart';
import '../../../../../../model/admin_models/brand_model.dart';
import '../../../../../../resources/routes.dart';
import '../../../../../../resources/values_manager.dart';
//TOOD:: get the products when click on the brand
class DisplayBrands extends StatelessWidget {
  const DisplayBrands({
    super.key, required this.brands,
  });
final List<BrandModel> brands;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
          onRefresh: () => context.read<StockBloc>().getBrands(),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                   brands[index].name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                        context, Routes.brandProducts,
                        arguments: brands[index].name);
                  },
                  trailing:
                      const Icon(Icons.arrow_forward_ios_rounded),
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(
                    height: SizeManager.sSpace
                  ),
              itemCount: brands.length),
        );
  }
}

