import '../../../../domain/entities/project_entity.dart';

abstract class GetProjectDetailsViewModelStates {}

class GetProjectDetailsViewModelInitial extends GetProjectDetailsViewModelStates {}
class GetProjectDetailsViewModelLoading extends GetProjectDetailsViewModelStates {}
class GetProjectDetailsViewModelSuccess extends GetProjectDetailsViewModelStates {
  final ProjectEntity project;

  GetProjectDetailsViewModelSuccess(this.project);
}
class GetProjectDetailsViewModelError extends GetProjectDetailsViewModelStates {
  final String message;

  GetProjectDetailsViewModelError(this.message);
}