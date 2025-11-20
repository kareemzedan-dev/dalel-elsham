import 'package:dart_either/dart_either.dart';

import '../../../../../../../../../../core/errors/failures.dart';
import '../../../../../domain/entities/project_entity.dart';

abstract class GetProjectsByDisplaySectionRemoteDataSource {
  Future<Either<Failures, List<ProjectEntity>>> getProjectsByDisplaySection(
    String displaySectionId,
  );
}