import 'package:flutter/material.dart';
import 'package:shop_app/generated/l10n.dart';
import 'package:shop_app/resources/image_manager.dart';
import 'package:shop_app/resources/routes.dart';
import 'package:shop_app/resources/values_manager.dart';


class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title:const Text("Admin"),),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: ListView(
          children: [
            Image.asset(ImageManager.splash),
            const SizedBox(height: SizeManager.sSpace),
            ListTile(
              onTap: () => Navigator.of(context).pushNamed(Routes.addProduct),
              title: Text(S.current.addProduct,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary)),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              onTap: () => Navigator.of(context).pushNamed(Routes.stock),
              title: Text(S.current.stock,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary)),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            )
          ],
        ),
      )),
    );
  }
}
