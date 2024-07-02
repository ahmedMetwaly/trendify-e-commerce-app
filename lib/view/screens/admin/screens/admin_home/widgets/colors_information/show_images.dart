import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/admin/color_management_bloc/color_bloc.dart';
import 'package:shop_app/bloc/admin/color_management_bloc/color_state.dart';
import 'package:shop_app/generated/l10n.dart';
import 'package:shop_app/resources/values_manager.dart';
import 'package:shop_app/view/components/gallary_view.dart';

class ShowImages extends StatelessWidget {
  const ShowImages({super.key, required this.indexOfImages});
  final int indexOfImages;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddColor, ColorStates>(
      builder: (context, state) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              height: 200,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GallaryView(
                            fromNetwork: false,
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
                                      context
                                          .read<AddColor>()
                                          .deleteImage(indexOfImages, index);
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
                    child: Image.file(
                      context.read<AddColor>().images[indexOfImages][index],
                      fit: BoxFit.cover,
                      width: 190,
                      height: 190,
                    ),
                  ),
                ),
                itemCount:
                    context.read<AddColor>().images[indexOfImages].length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
            const SizedBox(width: SizeManager.sSpace16),
            GestureDetector(
              onTap: () => context.read<AddColor>().addImages(indexOfImages),
              child: Container(
                alignment: Alignment.center,
                width: 190,
                height: 190,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
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
            )
          ],
        ),
      ),
    );
  }
}
