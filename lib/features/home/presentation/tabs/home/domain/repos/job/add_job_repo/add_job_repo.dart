import 'package:dart_either/dart_either.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../entities/job_entity.dart';

abstract class AddJobRepo {
  Future<Either<Failures, void>> addJob(JobEntity job);
}