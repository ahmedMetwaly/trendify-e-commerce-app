import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:shop_app/resources/values_manager.dart';
import 'package:shop_app/view/components/image_from_network.dart';

class GallaryView extends StatefulWidget {
  GallaryView({
    super.key,
    required this.galleryItems,
  }) : pageController = PageController(initialPage: 0);

  final PageController pageController;
  final List<String> galleryItems;
  @override
  State<StatefulWidget> createState() {
    return _GallaryViewState();
  }
}

class _GallaryViewState extends State<GallaryView> {
  int currentIndex = 0;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: _buildItem,
            itemCount: widget.galleryItems.length,
            loadingBuilder: (context, event) => Center(
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
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
                borderRadius: BorderRadius.circular(SizeManager.sBorderRadius),
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              child: Text(
                "${currentIndex + 1} / ${widget.galleryItems.length}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    return PhotoViewGalleryPageOptions.customChild(
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ImageFromNetwork(
              imagePath: widget.galleryItems[index],
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height)),
      initialScale: PhotoViewComputedScale.covered,
      minScale: PhotoViewComputedScale.contained,
      heroAttributes: PhotoViewHeroAttributes(tag: index.toString()),
    );
  }
}
