abstract class DeleteProjectDisplaySectionViewModelStates {}

class DeleteProjectDisplaySectionViewModelInitial extends DeleteProjectDisplaySectionViewModelStates {}

class DeleteProjectDisplaySectionViewModelLoading extends DeleteProjectDisplaySectionViewModelStates {}

class DeleteProjectDisplaySectionViewModelSuccess extends DeleteProjectDisplaySectionViewModelStates {}

class DeleteProjectDisplaySectionViewModelError extends DeleteProjectDisplaySectionViewModelStates {
  final String message;
  DeleteProjectDisplaySectionViewModelError(this.message);
}