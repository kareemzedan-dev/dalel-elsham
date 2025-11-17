

 import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/job_entity.dart';
import '../../../../domain/repos/job/add_opportunity_repo/add_opportunity_repo.dart';
import '../../../data_sources/remote/jobs/add_opportunity_remote_data_source/add_opportunity_remote_data_source.dart';
@Injectable(as: AddOpportunityRepo)
class AddOpportunityRepoImpl implements AddOpportunityRepo {
   final AddOpportunityRemoteDataSource addOpportunityRemoteDataSource;
  AddOpportunityRepoImpl(this.addOpportunityRemoteDataSource);
  @override
  Future<Either<Failures, void>> addOpportunity(JobEntity job) {
    return addOpportunityRemoteDataSource.addOpportunity(job);
  }
}