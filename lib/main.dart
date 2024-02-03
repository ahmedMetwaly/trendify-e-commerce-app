import 'package:flutter/material.dart';
import 'package:shop_app/resources/router.dart';
import 'package:shop_app/resources/routes.dart';
import 'package:shop_app/resources/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'trendify',
      theme: ThemeManager.lightTheme,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: (settings) => RoutesGeneratour.getRoute(settings),
    );
  }
}
