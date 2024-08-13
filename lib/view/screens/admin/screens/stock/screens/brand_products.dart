import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/stock_bloc/stock_states.dart';
import 'package:shop_app/generated/l10n.dart';
import 'package:shop_app/resources/values_manager.dart';
import '../../../../../../bloc/admin/stock_bloc/stock_bloc.dart';
import '../widgets/display_products_of_brand.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final String? brandName =
        ModalRoute.of(context)?.settings.arguments as String?;

    context.read<StockBloc>().getBrandProducts(brandName ?? "");
    TextEditingController searchController = TextEditingController();
    if (brandName == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(S.current.error),
        ),
        body: Center(
          child: Text(S.current.unKnownError),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(brandName),
            leading: IconButton(
              onPressed: () {
                context.read<StockBloc>().setInit();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            actions: [
              Padding(
                padding:
                    const EdgeInsets.only(right: PaddingManager.pMainPadding),
                child: IconButton.filled(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(S.current.deleteBrand),
                                content: Text(
                                    "${S.current.deleteBrandConfirmation} $brandName ?"),
                                actions: [
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Text(S.current.cancel)),
                                  TextButton(
                                      onPressed: () async {
                                        Navigator.pop(context, true);
                                        await context
                                            .read<StockBloc>()
                                            .deleteBrand(brandName);
                                      },
                                      child: Text(S.current.delete)),
                                ],
                              ));
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )),
              )
            ],
          ),
          body: Padding(
              padding: const EdgeInsets.all(PaddingManager.pMainPadding),
              child: Column(
                children: [
                  TextFormField(
                    controller: searchController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintText: S.current.searchOnProducts,
                      prefixIcon: const Icon(Icons.search),
                    ),
                    onChanged: (value) => context
                        .read<StockBloc>()
                        .searchProduct(value,
                            context.read<StockBloc>().productsInSpecificBrand),
                  ),
                  const SizedBox(height: SizeManager.sSpace16),
                  Expanded(
                    child: BlocConsumer<StockBloc, StockStates>(
                      builder: (BuildContext context, StockStates state) {
                        if (state is StockLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (state is ProductsGotSuccess) {
                          if (state.products.isEmpty) {
                            return Center(
                                child: Text(S.current.noProductsFound));
                          } else {
                            return DisplayProductsOfBrand(
                                brandName: brandName,
                                products: context
                                    .read<StockBloc>()
                                    .productsInSpecificBrand);
                          }
                        }
                        if (state is SearchSuccessed) {
                          if (state.products.isEmpty) {
                            return Center(
                                child: Text(S.current.noProductsFound));
                          } else {
                            return DisplayProductsOfBrand(
                                brandName: brandName, products: state.products);
                          }
                        }

                        if (state is StockFailedState) {
                          return Center(
                            child: Column(
                              children: [
                                Text(state.message),
                                ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<StockBloc>()
                                          .getBrandProducts(brandName);
                                    },
                                    child: Text(S.current.retry)),
                              ],
                            ),
                          );
                        }

                        return DisplayProductsOfBrand(
                            brandName: brandName,
                            products: context
                                .read<StockBloc>()
                                .productsInSpecificBrand);
                      },
                      listener: (BuildContext context, StockStates state) {
                        if (state is BrandDeletedSuccessfully) {
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ),
                ],
              )));
    }
  }
}
