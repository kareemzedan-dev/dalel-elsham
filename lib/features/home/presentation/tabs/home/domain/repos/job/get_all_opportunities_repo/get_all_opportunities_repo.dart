import 'package:dart_either/dart_either.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../entities/job_entity.dart';

abstract class GetAllOpportunitiesRepo {
  Future<Either<Failures, List<JobEntity>>> getAllOpportunities();
}