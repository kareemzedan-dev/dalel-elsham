import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../entities/project_entity.dart';
import '../../../repos/projects/update_project_repository/update_project_repository.dart';

@injectable
class UpdateProjectUseCase {
  final UpdateProjectRepository updateProjectRepo;

  UpdateProjectUseCase(this.updateProjectRepo);

  Future<Either<Failures, void>> updateProject(ProjectEntity project) {
    return updateProjectRepo.updateProject(project);
  }
  Future<Either<Failures, void>> updateProjectViews(String projectId) {
    return updateProjectRepo.updateProjectViews(projectId);
  }
}
