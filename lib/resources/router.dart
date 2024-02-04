import 'package:flutter/material.dart';
import 'package:shop_app/resources/routes.dart';
import 'package:shop_app/resources/string_manager.dart';
import 'package:shop_app/view/screens/home/home.dart';
import 'package:shop_app/view/screens/home_screen/home_screen.dart';
import 'package:shop_app/view/screens/onboarding/onboarding.dart';
import 'package:shop_app/view/screens/signup/signup.dart';
import 'package:shop_app/view/screens/splash_screen/splash_screen.dart';

import '../view/screens/login/login.dart';

class RoutesGeneratour {
  static Route<dynamic> getRoute(RouteSettings route) {
    switch (route.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUp());

      case Routes.logIn:
        return MaterialPageRoute(builder: (_) => const LogIn());

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const Home());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return unFoundedRoute();
    }
  }

  static Route<dynamic> unFoundedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: const Text(StringManager.noRoute)),
              body: const Center(child: Text(StringManager.noRouteBody)),
            ));
  }
}
