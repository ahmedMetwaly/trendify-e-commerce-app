import 'package:flutter/material.dart';
import 'package:shop_app/resources/routes.dart';
import 'package:shop_app/view/screens/login/login.dart';
import '../../../resources/image_manager.dart';
import '../../../resources/string_manager.dart';
import '../../../resources/values_manager.dart';
import '../../components/elevated_button.dart';
import '../../components/space.dart';
import '../login/widgets/emailInput.dart';
import '../login/widgets/password.dart';
import '../login/widgets/socialmedia_btn.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
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
                  StringManager.signup,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: SizeManager.s80,
                ),
                Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return StringManager.requiredField;
                        } else if (!value.contains("[0-9]")) {
                          return StringManager.notValidName;
                        }
                        return null;
                      },
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: const InputDecoration(
                        labelText: StringManager.name,
                      ),
                    ),
                    const Space(),
                    Email(inputController: emailController),
                    const Space(),
                    Passsword(
                        inputController: passwordController,
                        insideSignInPage: false),
                    const SizedBox(height: SizeManager.sSpace16),
                    GestureDetector(
                      onTap: () {
                        //TODO:: got to the Login screen
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LogIn(),
                        ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(StringManager.alreadyHaveAccoount),
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
                      key: const Key("goHome"),
                      title: StringManager.signup.toUpperCase(),
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          // TODO:: check if mail found or not then save email in shared pref then goto home Page

                          Navigator.of(context)
                              .pushReplacementNamed(Routes.home_screen);
                        } else {
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.home_screen);

                          print("not valid");
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: SizeManager.s60),
                Column(
                  children: [
                    const Center(
                        child: Text(
                      StringManager.signUpWithSc,
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
