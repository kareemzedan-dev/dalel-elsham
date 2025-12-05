import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../entities/project_entity.dart';
import '../../../repos/projects/get_all_projects_repository/get_all_projects_repository.dart';
@injectable
class GetAllProjectsUseCase {
  final GetAllProjectsRepository getAllProjectsRepo;
  GetAllProjectsUseCase(this.getAllProjectsRepo);
  Future<Either<Failures, List<ProjectEntity>>> getAllProjects() {
    return getAllProjectsRepo.getAllProjects();
  }
}