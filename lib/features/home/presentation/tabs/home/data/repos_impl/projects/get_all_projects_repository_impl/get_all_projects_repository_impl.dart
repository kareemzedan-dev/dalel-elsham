 import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/project_entity.dart';
import '../../../../domain/repos/projects/get_all_projects_repository/get_all_projects_repository.dart';
import '../../../data_sources/remote/projects/get_all_projects_remote_data_source/get_all_projects_remote_data_source.dart';
@Injectable(as: GetAllProjectsRepository)
class GetAllProjectsRepositoryImpl implements GetAllProjectsRepository {
  final GetAllProjectsRemoteDataSource getAllProjectsRemoteDataSource;
  GetAllProjectsRepositoryImpl(this.getAllProjectsRemoteDataSource);

  @override
  Future<Either<Failures, List<ProjectEntity>>> getAllProjects() {
    return getAllProjectsRemoteDataSource.getAllProjects();
  }
}