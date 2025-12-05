abstract class AddProjectDisplaySectionViewModelStates {}

class AddProjectDisplaySectionViewModelInitial extends AddProjectDisplaySectionViewModelStates {}

class AddProjectDisplaySectionViewModelLoading extends AddProjectDisplaySectionViewModelStates {}

class AddProjectDisplaySectionViewModelSuccess extends AddProjectDisplaySectionViewModelStates {}

class AddProjectDisplaySectionViewModelError extends AddProjectDisplaySectionViewModelStates {
  final String message;
  AddProjectDisplaySectionViewModelError(this.message);
}