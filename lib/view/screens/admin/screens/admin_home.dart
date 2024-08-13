import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/sharedprefrences/sharedpref_bloc.dart';
import 'package:shop_app/generated/l10n.dart';
import 'package:shop_app/resources/image_manager.dart';
import 'package:shop_app/resources/routes.dart';
import 'package:shop_app/resources/values_manager.dart';

import '../../../../bloc/sharedprefrences/sharedpref_state.dart';
import '../widgets/go_to_screen.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SharedPrefBloc, SettingsStates>(
      builder: (BuildContext context, SettingsStates state) => Scaffold(
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
              GoToScreen(
                screenRoute: Routes.orders,
                title: S.current.orders,
              ),
              GoToScreen(
                screenRoute: Routes.profile,
                title: S.current.profile,
                arguments: "admin",
              ),
            ],
          ),
        )),
      ),
    );
  }
}
