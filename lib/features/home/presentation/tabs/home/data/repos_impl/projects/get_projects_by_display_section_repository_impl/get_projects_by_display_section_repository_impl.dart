import 'package:dalel_elsham/core/errors/failures.dart';

import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/entities/project_entity.dart';

import 'package:dart_either/src/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/repos/projects/get_projects_by_display_section_repository/get_projects_by_display_section_repository.dart';
import '../../../data_sources/remote/projects/get_projects_by_display_section_remote_data_source/get_projects_by_display_section_remote_data_source.dart';

@Injectable(as: GetProjectsByDisplaySectionRepository)
class GetProjectsByDisplaySectionRepositoryImpl
    implements GetProjectsByDisplaySectionRepository {
  final GetProjectsByDisplaySectionRemoteDataSource remoteDataSource;

  GetProjectsByDisplaySectionRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, List<ProjectEntity>>> getProjectsByDisplaySection(
    String displaySectionId,
  ) {
    return remoteDataSource.getProjectsByDisplaySection(displaySectionId);
  }
}
