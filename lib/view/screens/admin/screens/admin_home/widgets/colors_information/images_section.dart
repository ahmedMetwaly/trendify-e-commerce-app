import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/color_management_bloc/color_bloc.dart';
import 'package:shop_app/bloc/admin/color_management_bloc/color_state.dart';

import 'package:shop_app/view/screens/admin/screens/admin_home/widgets/colors_information/show_images.dart';
import 'pick_images.dart';

class ImagesSection extends StatelessWidget {
  const ImagesSection({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddColor, ColorStates>(
        builder: (context, state) =>
            context.read<AddColor>().images[index].isEmpty
                ? const PickImages()
                : SizedBox(
                    height: 200,
                    child: ShowImages(
                      indexOfImages: index,
                    )));
  }
}
