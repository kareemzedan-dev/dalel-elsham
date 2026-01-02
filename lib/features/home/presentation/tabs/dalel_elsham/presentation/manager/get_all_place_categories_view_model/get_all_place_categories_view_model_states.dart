abstract class GetAllPlaceCategoriesViewModelStates {}
class GetAllPlaceCategoriesViewModelStatesInitial extends GetAllPlaceCategoriesViewModelStates {}
class GetAllPlaceCategoriesViewModelStatesLoading extends GetAllPlaceCategoriesViewModelStates {}
class GetAllPlaceCategoriesViewModelStatesSuccess extends GetAllPlaceCategoriesViewModelStates {
  final List<Map<String, dynamic>> categories;
  GetAllPlaceCategoriesViewModelStatesSuccess({required this.categories});
}
class GetAllPlaceCategoriesViewModelStatesError extends GetAllPlaceCategoriesViewModelStates {
  final String message;
  GetAllPlaceCategoriesViewModelStatesError({required this.message});
}
