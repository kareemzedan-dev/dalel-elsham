import 'package:dart_either/dart_either.dart';

import '../../../../../../../../../../core/errors/failures.dart';
import '../../../../../domain/entities/project_entity.dart';
abstract class DeleteProjectRemoteDataSource {
  Future<Either<Failures, void>> deleteProject(String projectId);
}