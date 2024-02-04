import "package:flutter/material.dart";
import "package:shop_app/resources/image_manager.dart";
import "package:shop_app/resources/string_manager.dart";
import "package:shop_app/resources/values_manager.dart";
import "package:shop_app/view/components/elevated_button.dart";
import "package:shop_app/view/components/space.dart";
import 'package:shop_app/view/screens/login/widgets/email.dart';
import 'package:shop_app/view/screens/login/widgets/password.dart';
import 'package:shop_app/view/screens/login/widgets/socialmedia_btn.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringManager.logIn,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: SizeManager.s80,
                ),
                Column(
                  children: [
                    Email(inputController: emailController),
                    const Space(),
                    Passsword(
                        inputController: passwordController,
                        insideSignInPage: true),
                    const SizedBox(height: SizeManager.sSpace16),
                    GestureDetector(
                      onTap: () {
                        //TODO:: got to the forgot passsword screen
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(StringManager.forgotPassword),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: SizeManager.sIconSize,
                            color: Theme.of(context).colorScheme.primary,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: SizeManager.sSpace32),
                    MyElevatedButton(
                      title: StringManager.logIn.toUpperCase(),
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          print("valide");
                        } else {
                          print("not valid");
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: SizeManager.s80),
                Column(
                  children: [
                    const Center(
                        child: Text(
                      StringManager.loginWithSocialMedia,
                      textAlign: TextAlign.center,
                    )),
                    const SizedBox(
                      height: SizeManager.sSpace16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SocialMediaButton(
                            onPressed: () => debugPrint("Google"),
                            svgImagePath: ImageManager.google),
                        const SizedBox(
                          width: SizeManager.sSpace16,
                        ),
                        SocialMediaButton(
                            onPressed: () => debugPrint("Facebook"),
                            svgImagePath: ImageManager.facebook),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
