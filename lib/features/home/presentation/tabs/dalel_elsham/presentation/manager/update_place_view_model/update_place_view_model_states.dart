abstract class UpdatePlaceViewModelStates {}


class UpdatePlaceViewModelInitial extends UpdatePlaceViewModelStates {}

class UpdatePlaceViewModelLoading extends UpdatePlaceViewModelStates {}

class UpdatePlaceViewModelSuccess extends UpdatePlaceViewModelStates {}

class UpdatePlaceViewModelError extends UpdatePlaceViewModelStates {
  final String error;
  UpdatePlaceViewModelError({required this.error});
}
