import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../entities/project_entity.dart';
import '../../../repos/projects/get_project_details_repository/get_project_details_repository.dart';
@injectable
class GetProjectDetailsUsecase {
  final GetProjectDetailsRepository getProjectDetailsRepo;
  GetProjectDetailsUsecase(this.getProjectDetailsRepo);
  Future<Either<Failures, ProjectEntity>> getProjectDetails(String projectId) {
    return getProjectDetailsRepo.getProjectDetails(projectId);
  }
}