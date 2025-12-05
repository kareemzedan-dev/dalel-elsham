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

      print("RAW JOBS DATA: $data");

      // 3) فلترة الوظائف (معتمدة + نشطة + غير منتهية)
      final filtered = data.where((item) {
        final bool isActive = item["isActive"] == true;
        final String status =
        (item["status"] ?? "").toString().trim().toLowerCase();

        if (!(isActive && status == "approved")) return false;

        // ---------------------------------------
        // 🔵 قراءة createdAt بشكل صحيح
        // ---------------------------------------
        DateTime createdAt;

        final rawDate = item["createdAt"];

        if (rawDate is DateTime) {
          createdAt = rawDate; // تمام
        } else if (rawDate is String) {
          createdAt = DateTime.tryParse(rawDate) ?? DateTime(2000);
        } else {
          // Timestamp من Firestore → toDate()
          createdAt = rawDate.toDate();
        }

        // ---------------------------------------
        // 🔵 حساب مدة الصلاحية
        // ---------------------------------------
        int durationDays = 7; // default

        if (item["duration"] != null) {
          final match = RegExp(r'\d+').firstMatch(item["duration"].toString());
          if (match != null) durationDays = int.parse(match.group(0)!);
        }

        final bool isExpired =
            DateTime.now().difference(createdAt).inDays >= durationDays;

        return !isExpired;
      }).toList();

      print("FILTERED JOBS: $filtered");

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
