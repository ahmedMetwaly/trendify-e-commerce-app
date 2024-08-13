import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/view/screens/admin/screens/orders/bloc/order_states.dart';
import 'package:shop_app/view/screens/admin/screens/orders/bloc/orders_bloc.dart';
import 'package:shop_app/resources/values_manager.dart';

import '../screens/admin/screens/orders/repositeries/detect_state_repo.dart';

class ButtonGroup extends StatefulWidget {
  const ButtonGroup({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ButtonGroupState createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  int _selectedIndex = 0;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //context.read<OrderBloc>().getSpecificOrders(OrderStatesE.values[0]);

    return BlocBuilder<OrderBloc, OrderStates>(
      builder: (BuildContext context, OrderStates state) {
        return SizedBox(
          height: 30,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ElevatedButton(
                    onPressed: () {
                      _onButtonPressed(index);
                      context
                          .read<OrderBloc>()
                          .getOrdersByState(OrderStatesE.values[index]);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedIndex == index
                          ? Theme.of(context).colorScheme.surface
                          : Theme.of(context).colorScheme.background,
                      side: _selectedIndex != index
                          ? BorderSide(
                              color: Theme.of(context).colorScheme.surface,
                            )
                          : null,
                    ),
                    child: Text(
                        DetectOrderStateRepo(state: OrderStatesE.values[index])
                            .detectState(),
                        style: TextStyle(
                            color: _selectedIndex == index
                                ? Theme.of(context).colorScheme.inversePrimary
                                : Theme.of(context).colorScheme.surface)),
                  ),
              separatorBuilder: (context, index) =>
                  const SizedBox(width: SizeManager.sSpace),
              itemCount: OrderStatesE.values.length),
        );
      },
    );
  }
}
