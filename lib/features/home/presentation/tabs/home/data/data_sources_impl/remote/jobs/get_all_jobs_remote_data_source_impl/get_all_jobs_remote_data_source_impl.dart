import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../../../core/helper/network_validation.dart';
import '../../../../../../../../../../core/services/firebase_service.dart';
import '../../../../../domain/entities/job_entity.dart';
import '../../../../data_sources/remote/jobs/get_all_jobs_remote_data_source/get_all_jobs_remote_data_source.dart';
import '../../../../models/job_model.dart';
@Injectable(as: GetAllJobsRemoteDataSource)
class GetAllJobsRemoteDataSourceImpl implements GetAllJobsRemoteDataSource {
  final FirebaseService firebaseService;

  GetAllJobsRemoteDataSourceImpl(this.firebaseService);

  @override
  Future<Either<Failures, List<JobEntity>>> getAllJobs() async {
    try {
      // 1) تحقق من الإنترنت
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      // 2) جلب الداتا
      final data = await firebaseService.getCollection(
        collection: "jobs",
      );



      print("RAW JOBS DATA: $data"); // 👈 اطبع البيانات الخام من فايرستور

      final filtered = data.where((item) {
        final bool isActive = item["isActive"] == true;
        final String status =
        (item["status"] ?? "").toString().trim().toLowerCase();

        return isActive && status == "accepted";
      }).toList();

      print("FILTERED JOBS: $filtered"); // 👈 اطبع بعد الفلترة


      // 4) تحويل لموديل
      final jobs = filtered
          .map((item) => JobModel.fromMap(item, item["id"]))
          .toList();

      return Right(jobs);

    } catch (e) {
      return Left(ServerFailure("Error: $e"));
    }
  }
}
