import 'package:flutter/material.dart';
import 'package:shop_app/resources/routes.dart';
import 'package:shop_app/resources/string_manager.dart';
import 'package:shop_app/view/screens/admin/screens/admin_home.dart';
import 'package:shop_app/view/screens/admin/screens/coupons/coupons.dart';
import 'package:shop_app/view/screens/admin/screens/orders/view/orders/orders.dart';
import 'package:shop_app/view/screens/admin/screens/orders/view/view_order_details/view_order_details.dart';
import 'package:shop_app/view/screens/first_time_opened/first_time_opened.dart';
import 'package:shop_app/view/screens/home_screen/home_screen.dart';
import 'package:shop_app/view/screens/onboarding/onboarding.dart';
import 'package:shop_app/view/screens/profile/screens/history.dart';
import 'package:shop_app/view/screens/user/view/screens/shop/view/widgets/section_products.dart';
import 'package:shop_app/view/screens/signup/screens/forget_password.dart';
import 'package:shop_app/view/screens/signup/screens/reset_email.dart';
import 'package:shop_app/view/screens/signup/widgets/signup.dart';
import 'package:shop_app/view/screens/splash_screen/splash_screen.dart';
import '../view/screens/admin/screens/add_product/add_product.dart';
import '../view/screens/admin/screens/stock/screens/brand_products.dart';
import '../view/screens/admin/screens/stock/screens/stock.dart';
import '../view/screens/login/login.dart';
import '../view/screens/profile/profile.dart';
import '../view/screens/user/view/screens/home/view/home.dart';
import '../view/screens/user/view/screens/shop/view/screens/reviews.dart';
import '../view/screens/signup/screens/verfy_email.dart';

class RoutesGeneratour {
  static Route<dynamic> getRoute(RouteSettings route) {
    switch (route.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.appStarts:
        return MaterialPageRoute(builder: (_) => const AppStarts());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case Routes.verifyEmail:
        return MaterialPageRoute(builder: (_) => const VerifyEmail());
      case Routes.resetEmail:
        return MaterialPageRoute(builder: (_) => const ResetEmail());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      case Routes.logIn:
        return MaterialPageRoute(builder: (_) => const LogIn());
        case Routes.profile:
        return MaterialPageRoute(builder: (_) => const Profile(),settings: route);
      case Routes.adminHome:
        return MaterialPageRoute(builder: (_) => const AdminHome());
      case Routes.addProduct:
        return MaterialPageRoute(
            settings: route, builder: (_) => const AddProduct());
      case Routes.stock:
        return MaterialPageRoute(builder: (_) => const Stock());
      case Routes.coupons:
        return MaterialPageRoute(builder: (_) => const Coupons());
      case Routes.orders:
        return MaterialPageRoute(builder: (_) => const Orders());
      case Routes.viewOrderDetials:
        return MaterialPageRoute( settings: route,builder: (_) => const ViewOrderDetials());
      case Routes.brandProducts:
        return MaterialPageRoute(
            settings: route, builder: (_) => const BrandProducts());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const Home());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.partition:
        return MaterialPageRoute(builder: (_) => const SectionProducts());
      case Routes.reviews:
        return MaterialPageRoute(builder: (_) => const Reviews());

      case Routes.history:
        return MaterialPageRoute(builder: (_) => const History());
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
