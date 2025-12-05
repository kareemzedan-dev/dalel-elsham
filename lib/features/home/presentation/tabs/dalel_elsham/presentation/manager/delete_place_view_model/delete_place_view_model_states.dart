abstract class DeletePlaceViewModelStates {}

class DeletePlaceViewModelInitial extends DeletePlaceViewModelStates {}
class DeletePlaceViewModelLoading extends DeletePlaceViewModelStates {}
class DeletePlaceViewModelSuccess extends DeletePlaceViewModelStates {}
class DeletePlaceViewModelError extends DeletePlaceViewModelStates {
  final String error;
  DeletePlaceViewModelError({required this.error});
}
