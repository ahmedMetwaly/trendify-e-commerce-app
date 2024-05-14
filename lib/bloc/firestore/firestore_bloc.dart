import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/firebase/firestore_service.dart';
import '../authentication/auth_bloc.dart';
import 'firestore_event.dart';
import 'firestore_state.dart';

class FirestoreBloc extends Bloc<FirestoreEvents, FirestoreState> {
  FirestoreBloc() : super(InitialFirestore()) {
    on<UserUpdateDataEvent>(_updataUserHistory);
    on<UpdateUserFavouriteProductsEvent>(_updataUserFavourite);
    on<ChangeProfileImage>(_changeProfileImage);
  }

  FutureOr<void> _updataUserHistory(
      UserUpdateDataEvent event, Emitter<FirestoreState> emit) async {
    try {
      emit(UpdatindDataState());
      await FirestoreService()
          .updataUserData(
              userId: AuthenticationBloc.user.uid ?? "0",
              field: "history",
              data: AuthenticationBloc.user.history
                      ?.map((e) => e.toJson())
                      .toList() ??
                  [])
          .then((value) =>
              emit(UpdatedUserDataState(user: AuthenticationBloc.user)));
    } catch (error) {
      emit(UpdateFailedDataState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _updataUserFavourite(UpdateUserFavouriteProductsEvent event,
      Emitter<FirestoreState> emit) async {
    try {
      emit(UpdatingFavoriteState());
      await FirestoreService()
          .updataUserData(
              userId: AuthenticationBloc.user.uid ?? "0",
              field: "favouriteProducts",
              data: AuthenticationBloc.user.favouriteProducts
                      ?.map((e) => e.toJson())
                      .toList() ??
                  [])
          .then((value) =>
              emit(UpdatedUserFavoriteState(user: AuthenticationBloc.user)));
    } catch (error) {
      emit(UpdateFailedDataState(errorMessage: error.toString()));
    }
  }

  late XFile profileImage ;
  FutureOr<void> _changeProfileImage(
      ChangeProfileImage event, Emitter<FirestoreState> emit) async {
    try {
      emit(UpdatindDataState());
      await FirestoreService()
          .uploadImage(
              userId: AuthenticationBloc.user.uid ?? "0", image: profileImage)
          .then((value) {
            //print("image uploaded");
            AuthenticationBloc.user.imageUrl = value;
            return emit(UpdatedUserDataState(user: AuthenticationBloc.user));
          });
    } catch (error) {
      emit(UpdateFailedDataState(errorMessage: error.toString()));
    }
  }

 
}
