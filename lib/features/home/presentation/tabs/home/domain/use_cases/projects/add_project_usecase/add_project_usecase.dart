import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../entities/project_entity.dart';
import '../../../repos/projects/add_project_repository/add_project_repository.dart';
@injectable
class AddProjectUseCase {
  final AddProjectRepository addProjectRepo;
  AddProjectUseCase(this.addProjectRepo);
  Future<Either<Failures, void>> addProject(ProjectEntity project) {
    return addProjectRepo.addProject(project);
  }
}