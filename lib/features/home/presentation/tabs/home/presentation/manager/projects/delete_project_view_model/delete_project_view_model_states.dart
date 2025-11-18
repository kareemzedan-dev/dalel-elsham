abstract class DeleteProjectViewModelStates {}

class DeleteProjectViewModelInitial extends DeleteProjectViewModelStates {}
class DeleteProjectViewModelLoading extends DeleteProjectViewModelStates {}
class DeleteProjectViewModelSuccess extends DeleteProjectViewModelStates {}
class DeleteProjectViewModelError extends DeleteProjectViewModelStates {
  final String message;

  DeleteProjectViewModelError(this.message);
}
