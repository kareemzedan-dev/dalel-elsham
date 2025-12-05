import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../../../core/helper/network_validation.dart';
import '../../../../../../../../../../core/services/firebase_service.dart';
import '../../../../data_sources/remote/jobs/delete_job_remote_data_source/delete_job_remote_data_source.dart';
@Injectable(as: DeleteJobRemoteDataSource)
class DeleteJobRemoteDataSourceImpl implements DeleteJobRemoteDataSource {
  final FirebaseService firebaseService;
  DeleteJobRemoteDataSourceImpl(this.firebaseService);

  @override
  Future<Either<Failures, void>> deleteJob(String jobId) async {
    try {

      // 1) تأكيد الانترنت
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      // 2) احذف المستند من Firestore
      await firebaseService.deleteDocument(
        collection: "jobs",
        docId: jobId,
      );

      return const Right(null); // صح

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
