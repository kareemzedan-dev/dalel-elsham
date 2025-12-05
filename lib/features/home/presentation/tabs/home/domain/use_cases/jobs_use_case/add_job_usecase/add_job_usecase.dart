import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../entities/job_entity.dart';
import '../../../repos/job/add_job_repo/add_job_repo.dart';
@injectable
class AddJobUsecase {
  final AddJobRepo addJobRepo;
  AddJobUsecase(this.addJobRepo);
  Future<Either<Failures, void>> addJob(JobEntity jobEntity) {
    return addJobRepo.addJob(jobEntity);
  }
}