import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/color_management_bloc/color_bloc.dart';
import 'package:shop_app/bloc/admin/color_management_bloc/color_state.dart';

import 'package:shop_app/view/screens/admin/screens/add_product/widgets/colors_information/show_images.dart';
import 'pick_images.dart';

class ImagesSection extends StatelessWidget {
  const ImagesSection(
      {super.key,
      required this.index,
      required this.fromNetwork,
      required this.id});
  final int index;
  final bool fromNetwork;
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddColor, ColorStates>(builder: (context, state) {
      print("index $index");
      if (fromNetwork == true) {
        print("images : ${context.read<AddColor>().imagesFromNetwork[index]}");
        print("images : ${context.read<AddColor>().images[index]}");
           return context.read<AddColor>().imagesFromNetwork[index].isEmpty && context.read<AddColor>().images[index].isEmpty 
            ? PickImages(
                fromNetwork: true,
                productId: id,
                index: index,
              )
            : SizedBox(
                height: 200,
                child: ShowImages(
                  id: id,
                  indexOfImages: index,
                  fromNetwork: fromNetwork,
                )); 
       /*  if (context.read<AddColor>().imagesFromNetwork[index].isEmpty) {
          return PickImages(
            fromNetwork: true,
            productId: id,
          );
        } else {
          return SizedBox(
              height: 200,
              child: ShowImages(
                id: id,
                indexOfImages: index,
                fromNetwork: fromNetwork,
              ));
          return SizedBox(
              height: 200,
              child: ShowImages(
                id: id,
                indexOfImages: index,
                fromNetwork: fromNetwork,
              ));
        } */
      } else {
        return context.read<AddColor>().images[index].isEmpty
            ?  PickImages(
              index: index,
            )
            : SizedBox(
                height: 200,
                child: ShowImages(
                  id: id,
                  indexOfImages: index,
                  fromNetwork: fromNetwork,
                ));
      }
    });
  }
}
