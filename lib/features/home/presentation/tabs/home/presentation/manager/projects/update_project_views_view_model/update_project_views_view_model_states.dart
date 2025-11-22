abstract class UpdateProjectViewsViewModelStates {}
class UpdateProjectViewsViewModelInitial extends UpdateProjectViewsViewModelStates {}
class UpdateProjectViewsViewModelLoading extends UpdateProjectViewsViewModelStates {}
class UpdateProjectViewsViewModelError extends UpdateProjectViewsViewModelStates {
  final String message;
  UpdateProjectViewsViewModelError(this.message);
}
class UpdateProjectViewsViewModelSuccess extends UpdateProjectViewsViewModelStates {}