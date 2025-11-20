import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../entities/project_entity.dart';
import '../../../repos/projects/get_projects_by_display_section_repository/get_projects_by_display_section_repository.dart';
@injectable
class GetProjectsByDisplaySectionUseCase {
  final GetProjectsByDisplaySectionRepository repository;

  GetProjectsByDisplaySectionUseCase(this.repository);

  Future<Either<Failures, List<ProjectEntity>>> call(String displaySectionId) {
    return repository.getProjectsByDisplaySection(displaySectionId);
  }
}