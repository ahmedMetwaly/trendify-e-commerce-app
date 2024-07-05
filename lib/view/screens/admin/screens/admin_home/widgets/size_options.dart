import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/size_management_bloc/size_bloc.dart';
import 'package:shop_app/bloc/admin/size_management_bloc/size_state.dart';

class SizeOptions extends StatelessWidget {
  const SizeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddSize, SizeStates>(
      builder: (BuildContext context, SizeStates state) => SizedBox(
        height: context.read<AddSize>().sizes.length * 21,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 4),
            itemBuilder: (context, index) => CheckboxListTile(
                value: context.read<AddSize>().sizes.values.toList()[index],
                title: Text(context.read<AddSize>().sizes.keys.toList()[index]),
                onChanged: (value) =>
                    context.read<AddSize>().addAvailableSize(index, value)),
            itemCount: context.read<AddSize>().sizes.length),
      ),
    );
  }
}
