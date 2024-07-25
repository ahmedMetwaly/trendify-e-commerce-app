abstract class EditProductStates {}
class EditProductInitialState extends EditProductStates{}
class EditProductLoadingState extends EditProductStates{}
class EditProductSuccessState extends EditProductStates{}
class EditProductFailedState extends EditProductStates{
  final String errorMessage;

  EditProductFailedState({required this.errorMessage});
}
class ProductDeletedSuccessfully extends EditProductStates{}

class MainImageLoaded extends EditProductStates{}
class ImageDeleted extends EditProductStates{}