import '../../../../domain/entities/project_entity.dart';

abstract class GetAllProjectsViewModelStates {}

class GetAllProjectsViewModelInitial extends GetAllProjectsViewModelStates {}
class GetAllProjectsViewModelLoading extends GetAllProjectsViewModelStates {}
class GetAllProjectsViewModelSuccess extends GetAllProjectsViewModelStates {
  final List<ProjectEntity> projects;

  GetAllProjectsViewModelSuccess(this.projects);
}
class GetAllProjectsViewModelError extends GetAllProjectsViewModelStates {
  final String message;

  GetAllProjectsViewModelError(this.message);
}