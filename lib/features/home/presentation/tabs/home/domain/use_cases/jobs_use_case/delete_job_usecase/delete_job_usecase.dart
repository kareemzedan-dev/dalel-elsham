
  import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../repos/job/delete_job_repo/delete_job_repo.dart';
@injectable
class DeleteJobUsecase {
    final DeleteJobRepo deleteJobRepo;
    DeleteJobUsecase(this.deleteJobRepo);
    Future<Either<Failures, void>> deleteJob(String jobId) {
      return deleteJobRepo.deleteJob(jobId);
    }
  }