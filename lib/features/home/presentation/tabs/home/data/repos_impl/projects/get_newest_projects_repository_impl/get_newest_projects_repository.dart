import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/project_entity.dart';
import '../../../../domain/repos/projects/get_newest_projects_repository/get_newest_projects_repository.dart';
import '../../../data_sources/remote/projects/get_newest_projects_remote_data_source/get_newest_projects_remote_data_source.dart';
@Injectable(as: GetNewestProjectsRepository)
 class GetNewestProjectsRepositoryImpl implements GetNewestProjectsRepository {
  final GetNewestProjectsRemoteDataSource remoteDataSource;

  GetNewestProjectsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, List<ProjectEntity>>> getNewestProjects() {
    return remoteDataSource.getNewestProjects();
  }
}