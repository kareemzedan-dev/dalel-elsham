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

      /// ---------------------------
      /// 🔥 فلترة الحالة
      /// ---------------------------
      final bool isActive = data["isActive"] == true;
      final String status =
      (data["status"] ?? "").toString().trim().toLowerCase();

      if (!isActive || status != "approved") {
        return Left(ServerFailure("هذه الوظيفة غير متاحة"));
      }

      /// ---------------------------
      /// 🔥 فلترة المدة (Duration)
      /// ---------------------------
      final createdAt =
          DateTime.tryParse(data["createdAt"] ?? "") ?? DateTime(2000);

      int durationDays = 7; // قيمة افتراضية

      if (data["duration"] != null) {
        final match =
        RegExp(r'\d+').firstMatch(data["duration"].toString());
        if (match != null) {
          durationDays = int.parse(match.group(0)!);
        }
      }

      final isExpired =
          DateTime.now().difference(createdAt).inDays >= durationDays;

      if (isExpired) {
        return Left(ServerFailure("هذه الوظيفة انتهت صلاحيتها"));
      }

      /// ---------------------------
      /// 🔥 تحويل إلى Entity
      /// ---------------------------
      final job = JobModel.fromMap(data, jobId);

      return Right(job);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
