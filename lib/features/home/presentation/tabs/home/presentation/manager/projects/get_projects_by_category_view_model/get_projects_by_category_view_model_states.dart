import '../../../../domain/entities/project_entity.dart';

abstract class GetProjectsByCategoryViewModelStates {}

class GetProjectsByCategoryViewModelInitial extends GetProjectsByCategoryViewModelStates {}
class GetProjectsByCategoryViewModelLoading extends GetProjectsByCategoryViewModelStates {}
class GetProjectsByCategoryViewModelSuccess extends GetProjectsByCategoryViewModelStates {
  final List<ProjectEntity> projects;

  GetProjectsByCategoryViewModelSuccess(this.projects);
}
class GetProjectsByCategoryViewModelError extends GetProjectsByCategoryViewModelStates {
  final String message;

  GetProjectsByCategoryViewModelError(this.message);
}