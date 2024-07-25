import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/color_management_bloc/color_bloc.dart';
import 'package:shop_app/bloc/admin/color_management_bloc/color_state.dart';
import 'package:shop_app/generated/l10n.dart';
import 'package:shop_app/resources/values_manager.dart';
import 'package:shop_app/view/components/gallary_view.dart';
import 'package:shop_app/view/components/image_from_network.dart';
class ShowImages extends StatelessWidget {
  const ShowImages(
      {super.key,
      required this.indexOfImages,
      required this.fromNetwork,
      required this.id});
  final int indexOfImages;
  final bool fromNetwork;
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddColor, ColorStates>(
      builder: (context, state) {
        if (state is ImagesLoading) {
          if (state.indexOfImages == indexOfImages) {
            return const Center(child: CircularProgressIndicator());
          }
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:  Row(
            children: [
             fromNetwork==true? ColorImages(fromNetwork: fromNetwork, indexOfImages: indexOfImages):const SizedBox(),
             const SizedBox(width: 10),
              ColorImages(fromNetwork: false, indexOfImages: indexOfImages),
              const SizedBox(width: SizeManager.sSpace16),
              UploadImages(id: id, fromNetwork: fromNetwork, indexOfImages: indexOfImages)
            ],
          ),
        );
      },
    );
  }
}

class UploadImages extends StatelessWidget {
  const UploadImages({
    super.key,
    required this.id,
    required this.fromNetwork,
    required this.indexOfImages,
  });

  final String id;
  final bool fromNetwork;
  final int indexOfImages;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<AddColor>().addImages(
          productId: id,
          fromNetwork: fromNetwork,
          indexOfImages: indexOfImages),
      child: Container(
        alignment: Alignment.center,
        width: 190,
        height: 190,
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.primary),
          borderRadius:
              BorderRadius.circular(SizeManager.sBorderRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.collections_rounded),
            Text(S.current.uploadImages,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

class ColorImages extends StatelessWidget {
  const ColorImages({
    super.key,
    required this.fromNetwork,
    required this.indexOfImages,
  });

  final bool fromNetwork;
  final int indexOfImages;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            const SizedBox(width: 10),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => GallaryView(
                    justDisplay: false,
                    fromNetwork: fromNetwork,
                    currentIndex: index,
                    indexOfImages: indexOfImages,
                  ))),
          onLongPress: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(S.current.confirmDelete),
                      content: Text(S.current.deleteContent),
                      actions: [
                        TextButton(
                            onPressed: () {
                              context.read<AddColor>().deleteImage(
                                  fromNetwork: fromNetwork,
                                  indexOfImages: indexOfImages,
                                  index: index);
                              Navigator.pop(context, true);
                            },
                            child: Text(S.current.ok)),
                        TextButton(
                            onPressed: () =>
                                Navigator.pop(context, true),
                            child: Text(S.current.cancel)),
                      ],
                    ));
          },
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(SizeManager.sBorderRadius),
            child:  fromNetwork == true
                ?  ImageFromNetwork(
                    imagePath: context
                        .read<AddColor>()
                        .imagesFromNetwork[indexOfImages][index],
                    fit: BoxFit.cover,
                    width: 190,
                    height: 190,
                  )
                 : Image.file(
                    context.read<AddColor>().images[indexOfImages]
                        [index],
                    fit: BoxFit.cover,
                    width: 190,
                    height: 190,
                  ), 
          ),
        ),
        itemCount:  fromNetwork == true
            ?  context
                .read<AddColor>()
                .imagesFromNetwork[indexOfImages]
                .length
             : context.read<AddColor>().images[indexOfImages].length ,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
