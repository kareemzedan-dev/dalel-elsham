 import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/job_entity.dart';
import '../../../../domain/repos/job/add_job_repo/add_job_repo.dart';
import '../../../data_sources/remote/jobs/add_job_remote_data_source/add_job_remote_data_source.dart';
@Injectable(as: AddJobRepo)
class AddJobRepoImpl implements AddJobRepo {
  final AddJobRemoteDataSource addJobRemoteDataSource;
  AddJobRepoImpl(this.addJobRemoteDataSource);
  @override
  Future<Either<Failures, void>> addJob(JobEntity job) {
    return addJobRemoteDataSource.addJob(job);
  }
}