import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_app/bloc/admin/add_product_bloc/add_product_bloc.dart';
import 'package:shop_app/bloc/admin/category_bloc/category_bloc.dart';
import 'package:shop_app/bloc/admin/color_management_bloc/color_bloc.dart';
import 'package:shop_app/bloc/admin/material_informations_bloc/material_information_bloc.dart';
import 'package:shop_app/bloc/admin/size_management_bloc/size_bloc.dart';
import 'package:shop_app/bloc/authentication/auth_events.dart';
import 'package:shop_app/bloc/firestore/firestore_bloc.dart';
import 'package:shop_app/firebase_options.dart';
import 'package:shop_app/generated/l10n.dart';
import 'package:shop_app/resources/router.dart';
import 'package:shop_app/resources/routes.dart';
import 'package:shop_app/resources/theme_manager.dart';
import 'package:shop_app/services/api/dio.dart';
import 'package:shop_app/view_model/bloc/cart_view_model.dart';
import 'package:shop_app/view_model/bloc/partition_view_model.dart';
import 'package:shop_app/view_model/bloc/product_view_model.dart';
import 'bloc/authentication/auth_bloc.dart';
import 'bloc/sharedprefrences/sharedpref_bloc.dart';
import 'bloc/sharedprefrences/sharedpref_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  APIService.init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAppCheck.instance.activate(); // Ensure activation.

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => SharedPrefBloc()..appStarted(),
      lazy: false,
    ),
    BlocProvider(
      create: (context) => AuthenticationBloc()..add(AppStarted()),
      lazy: false,
    ),
    BlocProvider(create: (context) => FirestoreBloc()),
    BlocProvider(create: (context) => ProductViewModel()),
    BlocProvider(create: (context) => SectionViewModel()),
    BlocProvider(create: (context) => CartBloc()),
    BlocProvider(create: (context) => AddProductBloc()),
    BlocProvider(create: (context) => AddColor()),
    BlocProvider(create: (context) => AddSize()),
    BlocProvider(create: (context) => MaterialInformationBloc()),
    BlocProvider(
      create: (context) => CategoryBloc(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SharedPrefBloc, SettingsStates>(
      builder: (BuildContext context, SettingsStates state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale(context.read<SharedPrefBloc>().lang),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'trendify',
        theme: ThemeManager.lightTheme,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: (settings) => RoutesGeneratour.getRoute(settings),
      ),
    );
  }
}
