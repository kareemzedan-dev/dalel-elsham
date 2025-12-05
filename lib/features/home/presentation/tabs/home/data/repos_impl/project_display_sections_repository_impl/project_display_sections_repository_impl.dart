import 'package:dalel_elsham/core/errors/failures.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/entities/project_display_section_entity.dart';
import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repos/project_display_sections_repository/project_display_sections_repository.dart';
import '../../data_sources/remote/project_display_sections_remote_data_source/project_display_sections_remote_data_source.dart';

@Injectable(as: ProjectDisplaySectionsRepository)
class ProjectDisplaySectionsRepositoryImpl
    implements ProjectDisplaySectionsRepository {
  final ProjectDisplaySectionsRemoteDataSource remoteDataSource;

  ProjectDisplaySectionsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, void>> addProjectDisplaySection(
    ProjectDisplaySectionEntity projectDisplaySectionEntity,
  ) {
    return remoteDataSource.addProjectDisplaySection(
      projectDisplaySectionEntity,
    );
  }

  @override
  Future<Either<Failures, void>> deleteProjectDisplaySection(String id) {
    return remoteDataSource.deleteProjectDisplaySection(id);
  }

  @override
  Future<Either<Failures, List<ProjectDisplaySectionEntity>>>
  getAllProjectDisplaySections() {
    return remoteDataSource.getAllProjectDisplaySections();
  }

  @override
  Future<Either<Failures, void>> updateProjectDisplaySection(
    ProjectDisplaySectionEntity projectDisplaySectionEntity,
  ) {
    return remoteDataSource.updateProjectDisplaySection(
      projectDisplaySectionEntity,
    );
  }
}
