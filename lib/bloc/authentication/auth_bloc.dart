import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';
import '../../model/user.dart';
import '../../services/firebase/authentication_service.dart';
import '../../services/firebase/firestore_service.dart';
import '../../utilities/constants.dart';
import 'aurh_states.dart';
import 'auth_events.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvents, AuthenticationStates> {
  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<SignUpEvent>(_signUp);
    on<SignInWithEmailEvent>(_logIn);
    on<SignInWithGoogleEvent>(_loginWithGoogle);
    on<SignInWithFacebookEvent>(_loginWithFacebook);
    on<ForgetPasswordEvent>(_forgetPassword);
    on<SendEmailVerficationEvent>(_sendEmailVerfication);
    on<SignOutEvent>(_logOut);
    on<AppStarted>(_checkTheUserLogged);
  }

  static UserModel user = UserModel(
    uid: "0",
    name: S.current.guest,
    email: "",
    password: "",
    imageUrl: "",
    address: "",
    favouriteProducts: [],
    history: [],
    phoneNumber: "",
    cartProducts: [],
  );

  FutureOr<void> _checkTheUserLogged(
      AppStarted event, Emitter<AuthenticationStates> emit) async {
    final userFireBase = FirebaseAuth.instance.currentUser;
    // //print("checking if the user is null or not");
    if (userFireBase != null) {
      user = await FirestoreService().getUserData(userFireBase.uid);
      // //print("user found loggedIn");
      emit(AuthenticationSuccessState(user: user));
    } else {
      //print("No user");'
      emit(AuthLogedOutState());
    }
  }

  FutureOr<void> _signUp(
      SignUpEvent event, Emitter<AuthenticationStates> emit) async {
    emit(AuthinticationLoadingState());
    try {
      await FirebaseAuthService.signUp(
              emailAddress: user.email ?? "", password: user.password ?? "")
          .then((value) async {
        if (value is UserModel) {
          user = UserModel(
              uid: value.uid,
              name: user.name,
              email: user.email,
              imageUrl: user.imageUrl,
              password: user.password,
              address: user.address,
              favouriteProducts: user.favouriteProducts,
              history: user.history,
              phoneNumber: user.phoneNumber,
              cartProducts: user.cartProducts);
//          await FirebaseAuthService.sendEmailVerfication();
          await FirestoreService().saveUserData(user).then((userData) {
            emit(LoadedState());

            emit(AuthenticationSuccessState(user: user));
          });
        } else {
          emit(LoadedState());

          emit(AuthenticationFailedState(errorMessage: value.toString()));
        }
      });
    } catch (e) {
      emit(LoadedState());

      emit(AuthenticationFailedState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _logIn(
      SignInWithEmailEvent event, Emitter<AuthenticationStates> emit) async {
    emit(AuthinticationLoadingState());
    try {
      await FirebaseAuthService.signIn(
              emailAddress: user.email ?? "", password: user.password ?? "")
          .then((value) async {
        if (value is UserModel) {
          user = await FirestoreService().getUserData(value.uid ?? "0");
          emit(LoadedState());

          emit(AuthenticationSuccessState(user: user));
        } else {
          emit(LoadedState());

          emit(AuthenticationFailedState(errorMessage: value.toString()));
        }
      });
    } catch (e) {
      emit(LoadedState());

      emit(AuthenticationFailedState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _loginWithGoogle(
      SignInWithGoogleEvent event, Emitter<AuthenticationStates> emit) async {
    emit(AuthinticationLoadingState());
    try {
      await FirebaseAuthService.signInWithGoogle().then((userFormGoogle) async {
        //print(userFormGoogle.uid);
        if (userFormGoogle is UserModel) {
          await FirestoreService()
              .getUserData(userFormGoogle.uid ?? "0")
              .then((value) async {
            if (value is UserModel) {
              user = value;
              emit(LoadedState());

              emit(AuthenticationSuccessState(
                  user: user,
                  authenticationPlatform: AuthenticationPlatform.google));
            } else {
              user = UserModel(
                  uid: userFormGoogle.uid,
                  name: userFormGoogle.name,
                  email: userFormGoogle.email,
                  imageUrl: userFormGoogle.imageUrl,
                  password: userFormGoogle.password,
                  address: user.address,
                  favouriteProducts: user.favouriteProducts,
                  history: user.history,
                  phoneNumber: user.phoneNumber,
                  cartProducts: user.cartProducts);
              await FirestoreService().saveUserData(user).then((userData) {
                emit(LoadedState());

                emit(AuthenticationSuccessState(
                    user: user,
                    authenticationPlatform: AuthenticationPlatform.google));
              });
            }
          });
        } else {
          emit(LoadedState());

          emit(AuthenticationFailedState(
              errorMessage: userFormGoogle.toString()));
        }
      });
    } catch (error) {
      emit(LoadedState());

      emit(AuthenticationFailedState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _loginWithFacebook(
      SignInWithFacebookEvent event, Emitter<AuthenticationStates> emit) async {
    emit(AuthinticationLoadingState());
    try {
      await FirebaseAuthService.signInWithFacebook()
          .then((userFormFacebook) async {
        //print(userFormFacebook.uid);
        if (userFormFacebook is UserModel) {
          await FirestoreService()
              .getUserData(userFormFacebook.uid ?? "0")
              .then((value) async {
            if (value is UserModel) {
              user = value;
              emit(LoadedState());

              emit(AuthenticationSuccessState(
                  user: user,
                  authenticationPlatform: AuthenticationPlatform.facebook));
            } else {
              user = UserModel(
                  uid: userFormFacebook.uid,
                  name: userFormFacebook.name,
                  email: userFormFacebook.email,
                  imageUrl: userFormFacebook.imageUrl,
                  password: userFormFacebook.password,
                  favouriteProducts: user.favouriteProducts,
                  address: user.address,
                  history: user.history,
                  phoneNumber: user.phoneNumber,
                  cartProducts: user.cartProducts);
              await FirestoreService().saveUserData(user).then((userData) {
                emit(LoadedState());

                emit(AuthenticationSuccessState(
                    user: user,
                    authenticationPlatform: AuthenticationPlatform.facebook));
              });
            }
          });
        } else {
          emit(LoadedState());

          emit(AuthenticationFailedState(
              errorMessage: userFormFacebook.toString()));
        }
      });
    } catch (error) {
      //print(error.toString());
      emit(LoadedState());

      emit(AuthenticationFailedState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _forgetPassword(
      ForgetPasswordEvent event, Emitter<AuthenticationStates> emit) async {
    try {
      emit(AuthinticationLoadingState());
      await FirebaseAuthService.forgotPassword(user.email ?? "").then((value) {
        if (value == true) {
          emit(LoadedState());

          emit(ForgetPasswordEmailSentState(
              email: AuthenticationBloc.user.email ?? ""));
        } else {
          emit(LoadedState());

          emit(AuthenticationFailedState(errorMessage: value));
        }
      });
    } catch (error) {
      emit(LoadedState());

      emit(AuthenticationFailedState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _logOut(
      SignOutEvent event, Emitter<AuthenticationStates> emit) async {
    emit(AuthinticationLoadingState());
    await FirebaseAuthService.logOut();
    emit(LoadedState());

    emit(AuthLogedOutState());
  }

  FutureOr<void> _sendEmailVerfication(SendEmailVerficationEvent event,
      Emitter<AuthenticationStates> emit) async {
    try {
      await FirebaseAuthService.sendEmailVerfication().then((value) {
        if (value == true) {
          emit(EmailVerficationSentState(
              email: AuthenticationBloc.user.email ?? ""));
        }
      });
    } catch (error) {
      emit(LoadedState());

      emit(AuthenticationFailedState(errorMessage: error.toString()));
    }
  }
}
