 import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/repos/job/delete_job_repo/delete_job_repo.dart';
import '../../../data_sources/remote/jobs/delete_job_remote_data_source/delete_job_remote_data_source.dart';
@Injectable(as: DeleteJobRepo)
class DeleteJobRepoImpl implements DeleteJobRepo {
  final DeleteJobRemoteDataSource deleteJobRemoteDataSource;
  DeleteJobRepoImpl(this.deleteJobRemoteDataSource);
  @override
  Future<Either<Failures, void>> deleteJob(String jobId) {
    return deleteJobRemoteDataSource.deleteJob(jobId);
  }
}