import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../../../core/helper/network_validation.dart';
import '../../../../../../../../../../core/services/firebase_service.dart';
import '../../../../../domain/entities/job_entity.dart';
import '../../../../data_sources/remote/jobs/get_job_by_id_remote_data_source/get_job_by_id_remote_data_source.dart';
import '../../../../models/job_model.dart';
@Injectable(as: GetJobByIdRemoteDataSource)
class GetJobByIdRemoteDataSourceImpl implements GetJobByIdRemoteDataSource {
  final FirebaseService firebaseService;

  GetJobByIdRemoteDataSourceImpl(this.firebaseService);

  @override
  Future<Either<Failures, JobEntity>> getJobById(String jobId) async {
    try {
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      final data = await firebaseService.getDocument(
        collection: "jobs",
        docId: jobId,
      );

      if (data == null) {
        return Left(ServerFailure("الوظيفة غير موجودة"));
      }

      if (data["isActive"] != true || data["status"] != "accepted") {
        return Left(ServerFailure("هذه الوظيفة غير متاحة"));
      }

      final job = JobModel.fromMap(data, jobId);

      return Right(job);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
