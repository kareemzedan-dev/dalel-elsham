import 'package:dart_either/dart_either.dart';

import '../../../../../../../../../../core/errors/failures.dart';
import '../../../../../domain/entities/job_entity.dart';

abstract class GetAllOpportunitiesRemoteDataSource {
  Future<Either<Failures, List<JobEntity>>> getAllOpportunities();
}