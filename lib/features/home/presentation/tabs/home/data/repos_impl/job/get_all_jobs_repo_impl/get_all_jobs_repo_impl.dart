
 import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/job_entity.dart';
import '../../../../domain/repos/job/get_all_jobs_repo/get_all_jobs_repo.dart';
import '../../../data_sources/remote/jobs/get_all_jobs_remote_data_source/get_all_jobs_remote_data_source.dart';
@Injectable(as: GetAllJobsRepo)
class GetAllJobsRepoImpl implements GetAllJobsRepo{
  final GetAllJobsRemoteDataSource getAllJobsRemoteDataSource;
  GetAllJobsRepoImpl(this.getAllJobsRemoteDataSource);
  @override
  Future<Either<Failures, List<JobEntity>>> getAllJobs() {
    return getAllJobsRemoteDataSource.getAllJobs();
  }
}