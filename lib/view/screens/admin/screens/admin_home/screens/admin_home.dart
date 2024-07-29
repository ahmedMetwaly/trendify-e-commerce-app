import 'package:flutter/material.dart';
import 'package:shop_app/generated/l10n.dart';
import 'package:shop_app/resources/image_manager.dart';
import 'package:shop_app/resources/routes.dart';
import 'package:shop_app/resources/values_manager.dart';

import '../widgets/go_to_screen.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: ListView(
          children: [
            Image.asset(ImageManager.splash),
            const SizedBox(height: SizeManager.sSpace),
            GoToScreen(
              screenRoute: Routes.addProduct,
              title: S.current.addProduct,
            ),
            GoToScreen(
              screenRoute: Routes.stock,
              title: S.current.stock,
            ),
            GoToScreen(
              screenRoute: Routes.coupons,
              title: S.current.coupons,
            ),
          ],
        ),
      )),
    );
  }
}
