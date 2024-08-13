import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../user_repos/user_repo.dart';
import '../../../../../bloc/authentication/auth_bloc.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  UserBloc() : super(InitialFirestore()) {
    on<UserUpdateHistoryEvent>(_updataUserHistory);
    on<UpdateUserFavouriteProductsEvent>(_updataUserFavourite);
    on<ChangeProfileImage>(_changeProfileImage);
  }

  FutureOr<void> _updataUserHistory(
      UserUpdateHistoryEvent event, Emitter<UserState> emit) async {
    try {
      emit(UpdatindDataState());
      //TODO:: remove the dublicated from history
      await UserRepo()
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
      Emitter<UserState> emit) async {
    try {
      emit(UpdatingFavoriteState());
      await UserRepo()
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
      ChangeProfileImage event, Emitter<UserState> emit) async {
    try {
      emit(UpdatindDataState());
      await UserRepo()
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
