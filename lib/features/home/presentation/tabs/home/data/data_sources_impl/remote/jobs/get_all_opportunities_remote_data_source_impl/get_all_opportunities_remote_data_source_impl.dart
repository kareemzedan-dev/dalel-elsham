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

      // 2) جلب كل فرص العمل من Firestore
      final data = await firebaseService.getCollection(
        collection: "opportunities",
      );

      final filtered = data.where((item) {
        return item["status"] == "accepted" &&
            item["isActive"] == true;
      }).toList();

      // 4) تحويل النتائج إلى JobModel
      final opportunities = filtered.map((item) {
        return JobModel.fromMap(item, item["id"]);
      }).toList();

      return Right(opportunities);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
