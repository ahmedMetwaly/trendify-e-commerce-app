import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/resources/routes.dart';
import 'package:shop_app/view/screens/admin/screens/orders/bloc/orders_bloc.dart';

import '../../../../../../../../generated/l10n.dart';

class MySearchDelegate extends SearchDelegate {
  final List<String> items;

  MySearchDelegate(this.items);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in items) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Row(
            children: [
              Text(S.current.order),
              const SizedBox(width: 5),
              Text(result),
            ],
          ),
          onTap: () {
            // print(result);
            Navigator.of(context).pushNamed(Routes.viewOrderDetials,
                arguments: context.read<OrderBloc>().getOrderById(result));
            //close(context, result);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in items) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Row(
            children: [
              Text(S.current.order),
              const SizedBox(width: 5),
              Text(result),
            ],
          ),
          onTap: () {
            query = result;
            showResults(context);
          },
        );
      },
    );
  }
}
