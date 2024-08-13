import '../../../../../../../model/admin_models/product.dart';

abstract class SectionStates {}

class InitialSectionState extends SectionStates {}

class LoadingSectionState extends SectionStates {}

class SuccessSectionState extends SectionStates {
  final List<Product> products;
  SuccessSectionState({required this.products});
}

class ErrorSectionState extends SectionStates {
  final String error;
  ErrorSectionState({required this.error});
}
