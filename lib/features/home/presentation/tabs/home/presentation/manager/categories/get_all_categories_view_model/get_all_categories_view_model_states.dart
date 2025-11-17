import '../../../../domain/entities/category_entity.dart';

abstract class GetAllCategoriesViewModelStates {}

class GetAllCategoriesViewModelInitial extends GetAllCategoriesViewModelStates {}

class GetAllCategoriesViewModelLoading extends GetAllCategoriesViewModelStates {}

class GetAllCategoriesViewModelSuccess extends GetAllCategoriesViewModelStates {
  final List<CategoryEntity> categories;
  GetAllCategoriesViewModelSuccess(this.categories);
}

class GetAllCategoriesViewModelError extends GetAllCategoriesViewModelStates {
  final String message;
  GetAllCategoriesViewModelError(this.message);
}
