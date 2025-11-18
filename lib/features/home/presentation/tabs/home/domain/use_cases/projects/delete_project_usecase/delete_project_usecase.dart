import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../entities/project_entity.dart';
import '../../../repos/projects/delete_project_repository/delete_project_repository.dart';
@injectable
class DeleteProjectUseCase {
  final DeleteProjectRepository deleteProjectRepo;
  DeleteProjectUseCase(this.deleteProjectRepo);
  Future<Either<Failures, void>> deleteProject(String project) {
    return deleteProjectRepo.deleteProject( project);
  }
}