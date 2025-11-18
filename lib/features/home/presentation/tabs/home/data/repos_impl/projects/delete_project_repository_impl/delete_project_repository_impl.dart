import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/repos/projects/delete_project_repository/delete_project_repository.dart';
import '../../../data_sources/remote/projects/delete_project_remote_data_source/delete_project_remote_data_source.dart';
@Injectable(as: DeleteProjectRepository)
class DeleteProjectRepositoryImpl implements DeleteProjectRepository {
  final DeleteProjectRemoteDataSource deleteProjectRemoteDataSource;
  DeleteProjectRepositoryImpl(this.deleteProjectRemoteDataSource);

  @override
  Future<Either<Failures, void>> deleteProject(String projectId) {
    return deleteProjectRemoteDataSource.deleteProject(projectId);
  }
}