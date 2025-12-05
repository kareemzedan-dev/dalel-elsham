 import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/job_entity.dart';
import '../../../../domain/repos/job/get_job_by_id_repo/get_job_by_id_repo.dart';
import '../../../data_sources/remote/jobs/get_job_by_id_remote_data_source/get_job_by_id_remote_data_source.dart';
@Injectable(as: GetJobByIdRepo)
class GetJobByIdRepoImpl implements GetJobByIdRepo{
  final GetJobByIdRemoteDataSource getJobByIdRemoteDataSource;
  GetJobByIdRepoImpl(this.getJobByIdRemoteDataSource);
  @override
  Future<Either<Failures, JobEntity>> getJobById(String jobId) {
    return getJobByIdRemoteDataSource.getJobById(jobId);
  }
}