import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/stock_bloc/stock_bloc.dart';
import 'package:shop_app/bloc/admin/stock_bloc/stock_states.dart';
import 'package:shop_app/generated/l10n.dart';
import 'package:shop_app/resources/values_manager.dart';
import '../widgets/display_brands.dart';

class Stock extends StatelessWidget {
  const Stock({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    context.read<StockBloc>().getBrands();
    print("inStock");
    return Scaffold(
      appBar: AppBar(title: Text(S.current.stock)),
      body: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: S.current.search,
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) => context.read<StockBloc>().search(value),
            ),
            const SizedBox(height: SizeManager.sSpace16),
            Expanded(
              child: BlocBuilder<StockBloc, StockStates>(
                buildWhen: (previous, current) => current is BrandsGotSuccess,
                builder: (BuildContext context, StockStates state) {
                  if (state is StockLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is BrandsGotSuccess) {
                    if (state.brands.isEmpty) {
                      return Center(child: Text(S.current.noBrandsFound));
                    } else {
                      return DisplayBrands(brands: state.brands);
                    }
                  }
                  if (state is StockFailedState) {
                    return Center(
                      child: Column(
                        children: [
                          Text(state.message),
                          ElevatedButton(
                              onPressed: () {
                                context.read<StockBloc>().getBrands();
                              },
                              child: Text(S.current.retry)),
                        ],
                      ),
                    );
                  }
                  return DisplayBrands(
                      brands: context.read<StockBloc>().brands);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
