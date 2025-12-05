import 'package:dalel_elsham/core/errors/failures.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/entities/project_display_section_entity.dart';
import 'package:dart_either/dart_either.dart';

abstract class ProjectDisplaySectionsRemoteDataSource {
  Future<Either<Failures, List<ProjectDisplaySectionEntity>>>
  getAllProjectDisplaySections();

  Future<Either<Failures, void>> addProjectDisplaySection(
      ProjectDisplaySectionEntity projectDisplaySectionEntity,
      );

  Future<Either<Failures, void>> updateProjectDisplaySection(
      ProjectDisplaySectionEntity projectDisplaySectionEntity,
      );

  Future<Either<Failures, void>> deleteProjectDisplaySection(String id);
}
