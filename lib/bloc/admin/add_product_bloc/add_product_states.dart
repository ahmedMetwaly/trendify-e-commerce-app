abstract class AddProductStates {}

class AddProductInitial extends AddProductStates {}

class AddProductLoading extends AddProductStates {}

class AddProductSuccess extends AddProductStates {}

class AddProductError extends AddProductStates {
  final String error;
  AddProductError(this.error);
}

class MainImageLoaded extends AddProductStates {}

class MainImageDeleted extends AddProductStates {}

class CheckValidatorState extends AddProductStates{
  final bool isValid;

  CheckValidatorState({required this.isValid});
}
