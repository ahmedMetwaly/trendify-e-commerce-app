
import '../../../../../model/user.dart';

abstract class UserState {}
class  InitialFirestore extends UserState {}
class UpdatindDataState extends UserState {}
class  UpdatingFavoriteState  extends UserState {}

class UpdatedUserDataState extends UserState {
  final UserModel user;

  UpdatedUserDataState({required this.user});
}
class UpdatedUserFavoriteState extends UserState {
  final UserModel user;

  UpdatedUserFavoriteState({required this.user});
}
class UpdateFailedDataState extends UserState {
  final String errorMessage;

  UpdateFailedDataState({required this.errorMessage});
}
