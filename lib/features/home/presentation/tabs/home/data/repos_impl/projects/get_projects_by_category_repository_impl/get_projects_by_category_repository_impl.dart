 import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/project_entity.dart';
import '../../../../domain/repos/projects/get_projects_by_category_repository/get_projects_by_category_repository.dart';
import '../../../data_sources/remote/projects/get_projects_by_category_remote_data_source/get_projects_by_category_remote_data_source.dart';
@Injectable(as: GetProjectsByCategoryRepository)
class GetProjectsByCategoryRepositoryImpl implements GetProjectsByCategoryRepository {
  final GetProjectsByCategoryRemoteDataSource getProjectsByCategoryRemoteDataSource;
  GetProjectsByCategoryRepositoryImpl(this.getProjectsByCategoryRemoteDataSource);

  @override
  Future<Either<Failures, List<ProjectEntity>>> getProjectsByCategory(String category) {
    return getProjectsByCategoryRemoteDataSource.getProjectsByCategory(category);
  }
}