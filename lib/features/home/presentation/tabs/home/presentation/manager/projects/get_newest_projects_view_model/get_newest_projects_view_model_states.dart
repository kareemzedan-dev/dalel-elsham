import '../../../../domain/entities/project_entity.dart';

abstract class GetNewestProjectsViewModelStates {}
class GetNewestProjectsViewModelInitial extends GetNewestProjectsViewModelStates {}
class GetNewestProjectsViewModelLoading extends GetNewestProjectsViewModelStates {}
class GetNewestProjectsViewModelSuccess extends GetNewestProjectsViewModelStates {
  final List<ProjectEntity> projects;
  GetNewestProjectsViewModelSuccess(this.projects);
}
class GetNewestProjectsViewModelError extends GetNewestProjectsViewModelStates {
  final String message;
  GetNewestProjectsViewModelError(this.message);
}
