import 'package:dart_either/dart_either.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../entities/project_entity.dart';

abstract class UpdateProjectRepository {
  Future<Either<Failures, void>> updateProject(ProjectEntity project);
}