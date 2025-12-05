abstract class UpdateProjectViewModelStates {}

class UpdateProjectViewModelInitial extends UpdateProjectViewModelStates {}

class UpdateProjectViewModelLoading extends UpdateProjectViewModelStates {}

class UpdateProjectViewModelSuccess extends UpdateProjectViewModelStates {}

class UpdateProjectViewModelError extends UpdateProjectViewModelStates {
  final String message;

  UpdateProjectViewModelError(this.message);
}
