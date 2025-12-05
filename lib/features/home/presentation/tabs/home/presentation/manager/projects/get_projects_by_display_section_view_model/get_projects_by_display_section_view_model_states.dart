import '../../../../domain/entities/project_entity.dart';

abstract class GetProjectsByDisplaySectionViewModelStates {}
class GetProjectsByDisplaySectionViewModelStatesInitial extends GetProjectsByDisplaySectionViewModelStates {}
class GetProjectsByDisplaySectionViewModelStatesLoading extends GetProjectsByDisplaySectionViewModelStates {}
class GetProjectsByDisplaySectionViewModelStatesSuccess extends GetProjectsByDisplaySectionViewModelStates {
  final List<ProjectEntity> projects;
  GetProjectsByDisplaySectionViewModelStatesSuccess({required this.projects});
}
class GetProjectsByDisplaySectionViewModelStatesError extends GetProjectsByDisplaySectionViewModelStates {
  final String message;
  GetProjectsByDisplaySectionViewModelStatesError({required this.message});
}