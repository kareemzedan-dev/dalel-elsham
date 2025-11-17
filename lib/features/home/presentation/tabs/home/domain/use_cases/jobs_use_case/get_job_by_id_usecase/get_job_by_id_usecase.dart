import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../entities/job_entity.dart';
import '../../../repos/job/get_job_by_id_repo/get_job_by_id_repo.dart';
@injectable
class GetJobByIdUsecase {
  final GetJobByIdRepo getJobByIdRepo;
  GetJobByIdUsecase(this.getJobByIdRepo);
  Future<Either<Failures, JobEntity>> getJobById(String jobId) {
    return getJobByIdRepo.getJobById(jobId);
  }
}