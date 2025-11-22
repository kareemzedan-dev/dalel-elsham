 import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/project_entity.dart';
import '../../../../domain/repos/projects/update_project_repository/update_project_repository.dart';
import '../../../data_sources/remote/projects/update_project_remote_data_source/update_project_remote_data_source.dart';
@Injectable(as: UpdateProjectRepository)
class UpdateProjectRepositoryImpl implements UpdateProjectRepository {
  final UpdateProjectRemoteDataSource updateProjectRemoteDataSource;
  UpdateProjectRepositoryImpl(this.updateProjectRemoteDataSource);

  @override
  Future<Either<Failures, void>> updateProject(ProjectEntity project) {
    return updateProjectRemoteDataSource.updateProject(project);
  }

  @override
  Future<Either<Failures, void>> updateProjectViews(String projectId) {
    return updateProjectRemoteDataSource.updateProjectViews(projectId);
  }
}