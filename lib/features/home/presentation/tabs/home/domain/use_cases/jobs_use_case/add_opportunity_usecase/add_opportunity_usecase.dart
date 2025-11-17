
import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../entities/job_entity.dart';
import '../../../repos/job/add_opportunity_repo/add_opportunity_repo.dart';
@injectable
class AddOpportunityUsecase {
  final AddOpportunityRepo addOpportunityRepo;
  AddOpportunityUsecase(this.addOpportunityRepo);
  Future<Either<Failures, void>> addOpportunity(JobEntity opportunityEntity) {
    return addOpportunityRepo.addOpportunity(opportunityEntity);
  }
}