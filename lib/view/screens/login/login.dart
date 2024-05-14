import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:shop_app/bloc/authentication/auth_events.dart";
import "package:shop_app/resources/image_manager.dart";
import "package:shop_app/resources/string_manager.dart";
import "package:shop_app/resources/values_manager.dart";
import "package:shop_app/utilities/constants.dart";
import "package:shop_app/view/components/elevated_button.dart";
import "package:shop_app/view/components/space.dart";
import 'package:shop_app/view/screens/login/widgets/email.dart';
import 'package:shop_app/view/screens/login/widgets/password.dart';
import 'package:shop_app/view/screens/login/widgets/socialmedia_btn.dart';
import "../../../bloc/authentication/aurh_states.dart";
import "../../../bloc/authentication/auth_bloc.dart";
import "../../../generated/l10n.dart";
import "../../../resources/routes.dart";

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
        child: BlocConsumer<AuthenticationBloc, AuthenticationStates>(
          builder: (BuildContext context, AuthenticationStates state) {
            return Form(
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
                    const SizedBox(height: SizeManager.s80),
                    Column(
                      children: [
                        Email(inputController: emailController),
                        const Space(),
                        Passsword(
                            inputController: passwordController,
                            insideSignInPage: true),
                        const SizedBox(height: SizeManager.sSpace16),
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(Routes.forgetPassword),
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
                              AuthenticationBloc.user.email =
                                  emailController.text.trim().toString();
                              AuthenticationBloc.user.password =
                                  passwordController.text.trim().toString();
                              context
                                  .read<AuthenticationBloc>()
                                  .add(SignInWithEmailEvent());
                              print("valide");
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
                        const SizedBox(
                          height: SizeManager.sSpace,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.current.or),
                            TextButton(
                                onPressed: () => Navigator.of(context)
                                    .pushReplacementNamed(Routes.signUp),
                                child: Text(S.current.createAccount))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (BuildContext context, AuthenticationStates state) {
            print(state);
            if (state is AuthenticationSuccessState) {
              final currentUser = FirebaseAuth.instance.currentUser;
              // Navigator.pop(context);
              if (currentUser!.uid == adminId) {
                Navigator.pushReplacementNamed(context, Routes.adminHome);
              } else {
                if (state.authenticationPlatform ==
                        AuthenticationPlatform.google ||
                    state.authenticationPlatform ==
                        AuthenticationPlatform.facebook) {
                  Navigator.pushReplacementNamed(context, Routes.homeScreen);
                } else {
                  if (currentUser.emailVerified) {
                    Navigator.pushReplacementNamed(context, Routes.homeScreen);
                  } else {
                    Navigator.pushReplacementNamed(context, Routes.verifyEmail);
                  }
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
            if(state is LoadedState){
              Navigator.pop(context);
            }
            if (state is AuthenticationFailedState) {
             // Navigator.pop(context);
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
        ),
      )),
    );
  }
}
