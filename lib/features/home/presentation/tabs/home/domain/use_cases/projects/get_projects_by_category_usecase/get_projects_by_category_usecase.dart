import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../entities/project_entity.dart';
import '../../../repos/projects/get_projects_by_category_repository/get_projects_by_category_repository.dart';
@injectable
class GetProjectsByCategoryUseCase {
  final GetProjectsByCategoryRepository getProjectsByCategoryRepo;
  GetProjectsByCategoryUseCase(this.getProjectsByCategoryRepo);
  Future<Either<Failures, List<ProjectEntity>>> getProjectsByCategory(String category) {
    return getProjectsByCategoryRepo.getProjectsByCategory(category);
  }
}