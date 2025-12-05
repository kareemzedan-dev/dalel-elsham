
 import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/job_entity.dart';
import '../../../../domain/repos/job/get_all_opportunities_repo/get_all_opportunities_repo.dart';
import '../../../data_sources/remote/jobs/get_all_opportunities_remote_data_source/get_all_opportunities_remote_data_source.dart';
@Injectable(as: GetAllOpportunitiesRepo)
class GetAllOpportunitiesRepoImpl implements GetAllOpportunitiesRepo{
  final GetAllOpportunitiesRemoteDataSource getAllOpportunitiesRemoteDataSource;
  GetAllOpportunitiesRepoImpl(this.getAllOpportunitiesRemoteDataSource);
  @override
  Future<Either<Failures, List<JobEntity>>> getAllOpportunities() {
    return getAllOpportunitiesRemoteDataSource.getAllOpportunities();
  }
 }