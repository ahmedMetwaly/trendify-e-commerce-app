/* import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:shop_app/bloc/admin/color_management_bloc/color_bloc.dart';
import 'package:shop_app/bloc/admin/color_management_bloc/color_state.dart';
import 'package:shop_app/resources/values_manager.dart';
import 'package:shop_app/view/components/image_from_network.dart';

import '../../generated/l10n.dart';

// ignore: must_be_immutable
class GallaryView extends StatefulWidget {
  GallaryView(
      {super.key,
      this.galleryItems,
      this.currentIndex,
      this.indexOfImages,
      required this.fromNetwork})
      : pageController = PageController(initialPage: currentIndex ?? 0);
  final PageController pageController;
  int? currentIndex;
  final int? indexOfImages;
  final List<String>? galleryItems;
  final bool fromNetwork;
  @override
  State<StatefulWidget> createState() {
    return _GallaryViewState();
  }
}

class _GallaryViewState extends State<GallaryView> {
  void onPageChanged(int index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AddColor, ColorStates>(
        builder: (BuildContext context, ColorStates state) => Container(
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: _buildItem,
                itemCount: widget.fromNetwork
                    ? widget.galleryItems?.length
                    : context
                        .read<AddColor>()
                        .images[widget.indexOfImages ?? 0]
                        .length,
                loadingBuilder: (context, event) => Center(
                  child: CircularProgressIndicator(
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded /
                            event.expectedTotalBytes!,
                  ),
                ),
                pageController: widget.pageController,
                onPageChanged: onPageChanged,
                scrollDirection: Axis.horizontal,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: PaddingManager.pInternalPadding,
                      vertical: PaddingManager.p8),
                  margin: const EdgeInsets.all(MarginManager.m10),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(SizeManager.sBorderRadius),
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: Text(
                    "${widget.currentIndex??0 + 1} / ${widget.fromNetwork ? widget.galleryItems?.length : context.read<AddColor>().images[widget.indexOfImages ?? 0].length}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ),
              ),
              widget.fromNetwork
                  ? const SizedBox()
                  : Container(
                      alignment: Alignment.topRight,
                      margin: const EdgeInsets.all(MarginManager.m10),
                      child: IconButton.filled(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.close,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
              widget.fromNetwork
                  ? const SizedBox()
                  : Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.all(MarginManager.m10),
                      child: IconButton.filled(
                        onPressed: () {
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
                                                .deleteImage(
                                                    widget.indexOfImages ?? 0,
                                                    widget.currentIndex ?? 0);
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
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    return PhotoViewGalleryPageOptions.customChild(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: widget.fromNetwork
              ? ImageFromNetwork(
                  imagePath: widget.galleryItems![index],
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height)
              : Image.file(
                  context.read<AddColor>().images[widget.indexOfImages ?? 0]
                      [index],
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height),
        ),
        initialScale: PhotoViewComputedScale.covered,
        minScale: PhotoViewComputedScale.contained,
        heroAttributes: PhotoViewHeroAttributes(tag: index.toString()));
  }
}
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:shop_app/bloc/admin/color_management_bloc/color_bloc.dart';
import 'package:shop_app/bloc/admin/color_management_bloc/color_state.dart';
import 'package:shop_app/resources/values_manager.dart';
import 'package:shop_app/view/components/image_from_network.dart';

import '../../generated/l10n.dart';

// ignore: must_be_immutable
class GallaryView extends StatefulWidget {
  GallaryView(
      {super.key,
      this.galleryItems,
      this.currentIndex,
      this.indexOfImages,
      required this.justDisplay,
      required this.fromNetwork})
      : pageController = PageController(initialPage: currentIndex ?? 0);
  final PageController pageController;
  int? currentIndex;
  final int? indexOfImages;
  final List<String>? galleryItems;
  final bool justDisplay;
  final bool fromNetwork;
  @override
  State<StatefulWidget> createState() {
    return _GallaryViewState();
  }
}

class _GallaryViewState extends State<GallaryView> {
  void onPageChanged(int index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AddColor, ColorStates>(
        builder: (BuildContext context, ColorStates state) => Container(
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: _buildItem,
                itemCount: widget.justDisplay
                    ? widget.galleryItems?.length
                    : widget.fromNetwork == true
                        ? context
                            .read<AddColor>()
                            .imagesFromNetwork[widget.indexOfImages ?? 0]
                            .length
                        : context
                            .read<AddColor>()
                            .images[widget.indexOfImages ?? 0]
                            .length,
                loadingBuilder: (context, event) => Center(
                  child: CircularProgressIndicator(
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded /
                            event.expectedTotalBytes!,
                  ),
                ),
                pageController: widget.pageController,
                onPageChanged: onPageChanged,
                scrollDirection: Axis.horizontal,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: PaddingManager.pInternalPadding,
                      vertical: PaddingManager.p8),
                  margin: const EdgeInsets.all(MarginManager.m10),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(SizeManager.sBorderRadius),
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: Text(
                    "${widget.currentIndex ?? 0 + 1} / ${widget.justDisplay ? widget.galleryItems?.length : widget.fromNetwork == true ? context.read<AddColor>().imagesFromNetwork[widget.indexOfImages ?? 0].length : context.read<AddColor>().images[widget.indexOfImages ?? 0].length}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ),
              ),
              widget.justDisplay
                  ? const SizedBox()
                  : Container(
                      alignment: Alignment.topRight,
                      margin: const EdgeInsets.all(MarginManager.m10),
                      child: IconButton.filled(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.close,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
              widget.justDisplay
                  ? const SizedBox()
                  : Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.all(MarginManager.m10),
                      child: IconButton.filled(
                        onPressed: () {
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
                                                .deleteImage(
                                                    fromNetwork:
                                                        widget.fromNetwork,
                                                    indexOfImages:
                                                        widget.indexOfImages ??
                                                            0,
                                                    index:
                                                        widget.currentIndex ??
                                                            0);
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
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    return PhotoViewGalleryPageOptions.customChild(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: widget.justDisplay
              ? ImageFromNetwork(
                  imagePath: widget.galleryItems![index],
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height)
              : widget.fromNetwork == true
                  ? ImageFromNetwork(
                      imagePath: context
                          .read<AddColor>()
                          .imagesFromNetwork[widget.indexOfImages ?? 0][index],
                          fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height)
                  : Image.file(
                      context.read<AddColor>().images[widget.indexOfImages ?? 0]
                          [index],
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height),
        ),
        initialScale: PhotoViewComputedScale.covered,
        minScale: PhotoViewComputedScale.contained,
        heroAttributes: PhotoViewHeroAttributes(tag: index.toString()));
  }
}
