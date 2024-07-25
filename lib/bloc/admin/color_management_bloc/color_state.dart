abstract class ColorStates {}

class ColorsInitial extends ColorStates {}

class ColorLoading extends ColorStates {}

class ColorAdded extends ColorStates {}

class ColorChanged extends ColorStates {}

class DeleteColor extends ColorStates {}

class ImageSelected extends ColorStates {}

class ImagesLoading extends ColorStates {
  final int indexOfImages ;
  ImagesLoading({required this.indexOfImages});
}

class ImageDeleted extends ColorStates {}
