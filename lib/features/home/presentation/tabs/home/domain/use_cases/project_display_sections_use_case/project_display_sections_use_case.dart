import 'package:dalel_elsham/core/errors/failures.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/entities/project_display_section_entity.dart';
import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../repos/project_display_sections_repository/project_display_sections_repository.dart';
@injectable
class ProjectDisplaySectionsUseCase {
  final ProjectDisplaySectionsRepository projectDisplaySectionsRepository;

  ProjectDisplaySectionsUseCase({
    required this.projectDisplaySectionsRepository,
  });

  Future<Either<Failures, List<ProjectDisplaySectionEntity>>>
  getAllProjectDisplaySections() async {
    return await projectDisplaySectionsRepository
        .getAllProjectDisplaySections();
  }

  Future<Either<Failures, void>> addProjectDisplaySection(
    ProjectDisplaySectionEntity projectDisplaySectionEntity,
  ) async {
    return await projectDisplaySectionsRepository.addProjectDisplaySection(
      projectDisplaySectionEntity,
    );
  }

  Future<Either<Failures, void>> updateProjectDisplaySection(
    ProjectDisplaySectionEntity projectDisplaySectionEntity,
  ) async {
    return await projectDisplaySectionsRepository.updateProjectDisplaySection(
      projectDisplaySectionEntity,
    );
  }

  Future<Either<Failures, void>> deleteProjectDisplaySection(String id) async {
    return await projectDisplaySectionsRepository.deleteProjectDisplaySection(
      id,
    );
  }
}
