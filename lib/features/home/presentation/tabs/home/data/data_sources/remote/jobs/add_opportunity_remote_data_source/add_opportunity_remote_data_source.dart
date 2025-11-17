import 'package:dart_either/dart_either.dart';

import '../../../../../../../../../../core/errors/failures.dart';
import '../../../../../domain/entities/job_entity.dart';

abstract class  AddOpportunityRemoteDataSource {
  Future<Either<Failures, void>> addOpportunity(JobEntity job);
}