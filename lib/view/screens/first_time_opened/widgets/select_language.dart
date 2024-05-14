import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/sharedprefrences/sharedpref_state.dart';
import 'package:shop_app/generated/l10n.dart';
import 'package:shop_app/resources/routes.dart';
import '../../../../bloc/sharedprefrences/sharedpref_bloc.dart';
import '../../../../resources/values_manager.dart';

class MyToggleButtons extends StatelessWidget {
  const MyToggleButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool enIsSelected = true;
    return BlocConsumer<SharedPrefBloc, SettingsStates>(
      builder: (BuildContext context, SettingsStates state) => Padding(
        padding: const EdgeInsets.symmetric(
            vertical: PaddingManager.pInternalPadding),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<SharedPrefBloc>().changeLang("en");
                  enIsSelected = true;
                },
                style: ButtonStyle(
                    fixedSize:
                        const MaterialStatePropertyAll<Size>(Size(100, 45)),
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        enIsSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.surface),
                    shadowColor: MaterialStatePropertyAll<Color>(
                        Theme.of(context).colorScheme.primary),
                    side: MaterialStatePropertyAll(BorderSide(
                        color: enIsSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onSecondary))),
                child: Text(S.current.enLang,
                    style: TextStyle(
                      color: enIsSelected
                          ? Theme.of(context).colorScheme.inversePrimary
                          : Theme.of(context).colorScheme.inversePrimary,
                    )),
              ),
              const SizedBox(
                width: SizeManager.sSpace,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<SharedPrefBloc>().changeLang("ar");
                  enIsSelected = false;
                },
                style: ButtonStyle(
                    fixedSize:
                        const MaterialStatePropertyAll<Size>(Size(100, 45)),
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        enIsSelected
                            ? Theme.of(context).colorScheme.surface
                            : Theme.of(context).colorScheme.primary),
                    shadowColor: MaterialStatePropertyAll<Color>(
                        Theme.of(context).colorScheme.primary),
                    side: MaterialStatePropertyAll(BorderSide(
                        color: enIsSelected
                            ? Theme.of(context).colorScheme.onSecondary
                            : Theme.of(context).colorScheme.primary))),
                child: Text("العربية",
                    style: TextStyle(
                      color: enIsSelected
                          ? Theme.of(context).colorScheme.inversePrimary
                          : Theme.of(context).colorScheme.inversePrimary,
                    )),
              ),
            ],
          ),
        ),
      ),
      listener: (BuildContext context, SettingsStates state) {
        if (state is SettingsLoadedSuccessfully) {
          Navigator.of(context).pushReplacementNamed(Routes.onBoarding);
          print(state.language);
        }
      },
    );
  }
}
