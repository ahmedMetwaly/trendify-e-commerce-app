import "package:animated_splash_screen/animated_splash_screen.dart";
import "package:flutter/material.dart";
import "package:shop_app/resources/image_manager.dart";
import "package:shop_app/resources/values_manager.dart";
import "package:shop_app/view/screens/onboarding/onboarding.dart";

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
        screenFunction: () async {
          return const OnBoarding();
        },
        duration: 4000,
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImageManager.splash,
              height: SizeManager.splashIconSize,
              width: SizeManager.splashIconSize,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: SizeManager.sSpace,
            ),
            const CircularProgressIndicator(),
          ],
        ),
        splashIconSize: SizeManager.splashScreenIconSize,
        splashTransition: SplashTransition.fadeTransition,
        
        backgroundColor: Theme.of(context).colorScheme.background);
  }
}
