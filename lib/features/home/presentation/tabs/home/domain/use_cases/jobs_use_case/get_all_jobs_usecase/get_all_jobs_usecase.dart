
import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../entities/job_entity.dart';
import '../../../repos/job/get_all_jobs_repo/get_all_jobs_repo.dart';
@injectable
class GetAllJobsUsecase {
  final GetAllJobsRepo getAllJobsRepo;
  GetAllJobsUsecase(this.getAllJobsRepo);
  Future<Either<Failures, List<JobEntity>>> getAllJobs() {
    return getAllJobsRepo.getAllJobs();
  }
}