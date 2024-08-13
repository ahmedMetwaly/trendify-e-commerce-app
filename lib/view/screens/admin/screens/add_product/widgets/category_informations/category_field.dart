
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../bloc/admin/category_bloc/category_bloc.dart';
import '../../../../../../../bloc/admin/category_bloc/category_states.dart';
import 'drop_down_widget.dart';

class CategoryField extends StatelessWidget {
  const CategoryField({
    super.key, required this.title,required this.value, this.items, required this.onChanged, required this.hint,
  });
final String title;

  final String? value;
  final List<String>? items;
  final Function onChanged;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 17, fontWeight: FontWeight.w500)),
        BlocBuilder<CategoryBloc, CategoryStates>(
          builder: (BuildContext context, CategoryStates state) =>
              Expanded(
                child: DropDownButtonWidget(
                            value: value,
                            items: items,
                            hint : hint,
                            onChanged: (newvalue) => onChanged(newvalue),
                          ),
              ),
        ),
      ],
    );
  }
}
