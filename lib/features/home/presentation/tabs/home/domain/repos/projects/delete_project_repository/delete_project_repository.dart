import 'package:dart_either/dart_either.dart';

import '../../../../../../../../../core/errors/failures.dart';

abstract class DeleteProjectRepository {
  Future<Either<Failures, void>> deleteProject(String projectId);
}