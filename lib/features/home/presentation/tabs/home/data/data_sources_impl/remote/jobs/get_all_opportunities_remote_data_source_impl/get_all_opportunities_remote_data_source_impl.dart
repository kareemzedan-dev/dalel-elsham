import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../../../core/helper/network_validation.dart';
import '../../../../../../../../../../core/services/firebase_service.dart';
import '../../../../../domain/entities/job_entity.dart';
import '../../../../data_sources/remote/jobs/get_all_opportunities_remote_data_source/get_all_opportunities_remote_data_source.dart';
import '../../../../models/job_model.dart';
@Injectable(as: GetAllOpportunitiesRemoteDataSource)
class GetAllOpportunitiesRemoteDataSourceImpl
    implements GetAllOpportunitiesRemoteDataSource {

  final FirebaseService firebaseService;

  GetAllOpportunitiesRemoteDataSourceImpl(this.firebaseService);

  @override
  Future<Either<Failures, List<JobEntity>>> getAllOpportunities() async {
    try {
      // 1) التحقق من وجود انترنت
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      // 2) جلب كل فرص العمل
      final data = await firebaseService.getCollection(
        collection: "opportunities",
      );

      final filtered = data.where((item) {
        final bool isActive = item["isActive"] == true;
        final String status =
        (item["status"] ?? "").toString().trim().toLowerCase();

        if (!(isActive && status == "approved")) return false;

        // ----- التعامل الصحيح مع createdAt -----
        DateTime createdAt;

        final rawDate = item["createdAt"];
        if (rawDate is DateTime) {
          createdAt = rawDate;
        } else if (rawDate is String) {
          createdAt = DateTime.tryParse(rawDate) ?? DateTime(2000);
        } else {
          // Timestamp from Firestore
          createdAt = rawDate.toDate();
        }

        // ----- حساب المدة -----
        int durationDays = 7; // Default

        if (item["duration"] != null) {
          final match = RegExp(r'\d+').firstMatch(item["duration"].toString());
          if (match != null) durationDays = int.parse(match.group(0)!);
        }

        final bool isExpired =
            DateTime.now().difference(createdAt).inDays >= durationDays;

        return !isExpired;
      }).toList();

      // 4) تحويل لموديل
      final opportunities = filtered
          .map((item) => JobModel.fromMap(item, item["id"]))
          .toList();

      return Right(opportunities);

    } catch (e) {
      return Left(ServerFailure("Error: $e"));
    }
  }
}
