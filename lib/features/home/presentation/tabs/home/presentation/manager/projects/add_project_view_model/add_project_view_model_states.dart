abstract class AddNewServiceViewModelStates {}
class AddProjectViewModelInitial extends AddNewServiceViewModelStates {}
class AddProjectViewModelLoading extends AddNewServiceViewModelStates {}
class AddProjectViewModelSuccess extends AddNewServiceViewModelStates {}
class AddProjectViewModelError extends AddNewServiceViewModelStates {
  final String message;

  AddProjectViewModelError(this.message);
}