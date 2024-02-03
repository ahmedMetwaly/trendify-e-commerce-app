import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shop_app/resources/image_manager.dart';
import 'package:shop_app/resources/values_manager.dart';

import '../../../resources/routes.dart';
import '../../../resources/string_manager.dart';
import 'widgets/onboarding_button.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pages = [
      PageViewModel(
        title: StringManager.onboarding1Title,
        body: StringManager.onboarding1Body,
        image: Image.asset(ImageManager.onboarding1),
      ),
      PageViewModel(
        title: StringManager.onboarding2Title,
        body: StringManager.onboarding2Body,
        image: Image.asset(ImageManager.onboarding2),
      ),
      PageViewModel(
        title: StringManager.onboarding3Title,
        body: StringManager.onboarding3Body,
        image: Image.asset(ImageManager.onboarding3),
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          bodyPadding: const EdgeInsets.all(PaddingManager.pMainPadding),
          showSkipButton: true,
          curve: Curves.bounceInOut,
          onSkip: () => Navigator.of(context).pushReplacementNamed(Routes.signUp),
          onDone: () => Navigator.of(context).pushReplacementNamed(Routes.signUp),
          skip: const OnBoardingButton(title: StringManager.skip),
          next: const Icon(Icons.arrow_forward),
          done: const OnBoardingButton(title: StringManager.done),
          pages: pages,
        ),
      ),
    );
  }
}
