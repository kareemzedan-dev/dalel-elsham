

 import 'package:dalel_elsham/core/errors/failures.dart';

import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/entities/project_entity.dart';

import 'package:dart_either/src/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/repos/projects/add_project_repository/add_project_repository.dart';
import '../../../data_sources/remote/projects/add_project_remote_data_source/add_project_remote_data_source.dart';
@Injectable(as: AddProjectRepository)
class AddProjectRepositoryImpl implements AddProjectRepository {
  final AddProjectRemoteDataSource addProjectRemoteDataSource;
  AddProjectRepositoryImpl(this.addProjectRemoteDataSource);

  @override
  Future<Either<Failures, void>> addProject(ProjectEntity project) {
    return addProjectRemoteDataSource.addProject(project);
  }

 }