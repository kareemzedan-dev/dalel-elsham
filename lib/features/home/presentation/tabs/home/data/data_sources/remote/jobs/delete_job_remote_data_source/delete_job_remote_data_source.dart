import 'package:dart_either/dart_either.dart';

import '../../../../../../../../../../core/errors/failures.dart';
import '../../../../../domain/entities/job_entity.dart';

abstract class DeleteJobRemoteDataSource {
  Future<Either<Failures, void>> deleteJob(String jobId);
}