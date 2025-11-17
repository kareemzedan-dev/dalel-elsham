abstract class AddJobViewModelStates{}
class AddJobViewModelInitial extends AddJobViewModelStates{}
class AddJobViewModelLoading extends AddJobViewModelStates{}
class AddJobViewModelSuccess extends AddJobViewModelStates{}
class AddJobViewModelError extends AddJobViewModelStates{
  final String message;
  AddJobViewModelError(this.message);
}
