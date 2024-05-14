import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/authentication/aurh_states.dart';
import 'package:shop_app/generated/l10n.dart';
import 'package:shop_app/resources/routes.dart';
import 'package:shop_app/view/screens/signup/widgets/name.dart';
import '../../../../bloc/authentication/auth_events.dart';
import '../../../../model/user.dart';
import '../../../../resources/image_manager.dart';
import '../../../../resources/string_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../../utilities/constants.dart';
import '../../../components/elevated_button.dart';
import '../../../components/space.dart';
import '../../login/widgets/email.dart';
import '../../login/widgets/password.dart';
import '../../login/widgets/socialmedia_btn.dart';
import "../../../../bloc/authentication/auth_bloc.dart";
import 'phone.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final phoneNumber = TextEditingController();
    //TODO:: add address from images
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: BlocListener<AuthenticationBloc, AuthenticationStates>(
          listener: (BuildContext context, AuthenticationStates state) {
            print(state);
            if (state is AuthenticationSuccessState) {
              final currentUser = FirebaseAuth.instance.currentUser;
              if (state.authenticationPlatform ==
                      AuthenticationPlatform.google ||
                  state.authenticationPlatform ==
                      AuthenticationPlatform.facebook) {
                Navigator.pushReplacementNamed(context, Routes.homeScreen);
              } else {
                if (currentUser!.emailVerified) {
                  Navigator.pushReplacementNamed(context, Routes.homeScreen);
                } else {
                  Navigator.pushReplacementNamed(context, Routes.verifyEmail);
                }
              }
            }
            if (state is AuthinticationLoadingState) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is LoadedState) {
              Navigator.pop(context);
            }
            if (state is AuthenticationFailedState) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.current.error,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.error)),
                      Divider(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ],
                  ),
                  content: Text(state.errorMessage),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(S.current.ok),
                    ),
                  ],
                ),
              );
            }
          },
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
                      Name(nameController: nameController),
                      const Space(),
                      Email(inputController: emailController),
                      const Space(),
                      Passsword(
                          inputController: passwordController,
                          insideSignInPage: false),
                      const Space(),
                      Phone(controller: phoneNumber),
                      const Space(),
                      const SizedBox(height: SizeManager.sSpace16),
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed(Routes.logIn),
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
                            AuthenticationBloc.user = UserModel(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              imageUrl: "",
                              history: [],
                              favouriteProducts: [],
                              address: "",
                              phoneNumber: phoneNumber.text,
                              cartProducts: [],
                            );
                            context
                                .read<AuthenticationBloc>()
                                .add(SignUpEvent());
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
                              onPressed: () => context
                                  .read<AuthenticationBloc>()
                                  .add(SignInWithGoogleEvent()),
                              svgImagePath: ImageManager.google),
                          const SizedBox(
                            width: SizeManager.sSpace16,
                          ),
                          SocialMediaButton(
                              onPressed: () => context
                                  .read<AuthenticationBloc>()
                                  .add(SignInWithFacebookEvent()),
                              svgImagePath: ImageManager.facebook),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
