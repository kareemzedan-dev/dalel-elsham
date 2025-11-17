import 'package:dart_either/dart_either.dart';

import '../../../../../../../../../core/errors/failures.dart';

abstract class DeleteJobRepo {
  Future<Either<Failures, void>> deleteJob(String jobId);
}