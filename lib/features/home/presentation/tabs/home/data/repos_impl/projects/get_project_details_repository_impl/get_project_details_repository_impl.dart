 import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/project_entity.dart';
import '../../../../domain/repos/projects/get_project_details_repository/get_project_details_repository.dart';
import '../../../data_sources/remote/projects/get_project_details_remote_data_source/get_project_details_remote_data_source.dart';
@Injectable(as: GetProjectDetailsRepository)
class GetProjectDetailsRepositoryImpl implements GetProjectDetailsRepository {
  final GetProjectDetailsRemoteDataSource getProjectDetailsRemoteDataSource;
  GetProjectDetailsRepositoryImpl(this.getProjectDetailsRemoteDataSource);

  @override
  Future<Either<Failures, ProjectEntity>> getProjectDetails(String projectId) {
    return getProjectDetailsRemoteDataSource.getProjectDetails(projectId);
  }
}