import "package:flutter/material.dart";
import "package:shop_app/resources/string_manager.dart";
import "package:shop_app/view/components/image_from_network.dart";

class SizeGuide extends StatelessWidget {
  const SizeGuide({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringManager.sizeGuide,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Column(
        children: [
          ImageFromNetwork(
            imagePath: imageUrl,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
       /*    Expanded(
            child: GridView(
              padding: const EdgeInsets.all(PaddingManager.pMainPadding),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 1,
                  mainAxisExtent: MediaQuery.of(context).size.height * 0.13),
              children: sizeTemplate!.descriptionMulti!
                  .map((item) => Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black,
                            ),
                            child: Center(
                                child: Text(
                              item.sort.toString(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary),
                            )),
                          ),
                          const SizedBox(
                            width: PaddingManager.pInternalPadding,
                          ),
                          Expanded(
                              child: Text(
                            item.name ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                          )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                item.description ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 16),
                              )),
                        ],
                      ))
                  .toList()
                  .cast<Widget>(),
            ),
          ),
        */ ],
      ),
    );
  }
}
