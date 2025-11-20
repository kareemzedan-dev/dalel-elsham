abstract class AddPlaceViewModelStates {}
class AddPlaceViewModelInitial extends AddPlaceViewModelStates {}
class AddPlaceViewModelLoading extends AddPlaceViewModelStates {}
class AddPlaceViewModelSuccess extends AddPlaceViewModelStates {}
class AddPlaceViewModelError extends AddPlaceViewModelStates {
  final String error;
  AddPlaceViewModelError({required this.error});
}
