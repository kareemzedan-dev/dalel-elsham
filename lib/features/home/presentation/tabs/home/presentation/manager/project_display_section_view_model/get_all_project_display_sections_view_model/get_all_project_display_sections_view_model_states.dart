import '../../../../domain/entities/project_display_section_entity.dart';

abstract class GetAllProjectDisplaySectionsViewModelStates {}

class GetAllProjectDisplaySectionsViewModelInitial extends GetAllProjectDisplaySectionsViewModelStates {}

class GetAllProjectDisplaySectionsViewModelLoading extends GetAllProjectDisplaySectionsViewModelStates {}

class GetAllProjectDisplaySectionsViewModelSuccess extends GetAllProjectDisplaySectionsViewModelStates {
  final List<ProjectDisplaySectionEntity> projectDisplaySections;
  GetAllProjectDisplaySectionsViewModelSuccess(this.projectDisplaySections);
}

class GetAllProjectDisplaySectionsViewModelError extends GetAllProjectDisplaySectionsViewModelStates {
  final String message;
  GetAllProjectDisplaySectionsViewModelError(this.message);
}