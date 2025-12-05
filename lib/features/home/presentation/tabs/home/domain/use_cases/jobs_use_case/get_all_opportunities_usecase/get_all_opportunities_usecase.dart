import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../entities/job_entity.dart';
import '../../../repos/job/get_all_opportunities_repo/get_all_opportunities_repo.dart';
@injectable
class GetAllOpportunitiesUsecase {
  final GetAllOpportunitiesRepo getAllOpportunitiesRepo;
  GetAllOpportunitiesUsecase(this.getAllOpportunitiesRepo);
  Future<Either<Failures, List<JobEntity>>> getAllOpportunities() {
    return getAllOpportunitiesRepo.getAllOpportunities();
  }
}