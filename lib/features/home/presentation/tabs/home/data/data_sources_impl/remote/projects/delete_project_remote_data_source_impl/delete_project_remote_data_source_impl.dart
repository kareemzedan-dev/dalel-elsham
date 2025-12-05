import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../../../core/helper/network_validation.dart';
import '../../../../../../../../../../core/services/firebase_service.dart';
import '../../../../../domain/entities/project_entity.dart';
import '../../../../data_sources/remote/projects/delete_project_remote_data_source/delete_project_remote_data_source.dart';
@Injectable(as: DeleteProjectRemoteDataSource)
class DeleteProjectRemoteDataSourceImpl implements DeleteProjectRemoteDataSource {
  final FirebaseService fireStoreService;

  DeleteProjectRemoteDataSourceImpl(this.fireStoreService);

  @override
  Future<Either<Failures, void>> deleteProject(String projectId) async {
    try {
      // 🔍 التحقق من الاتصال بالإنترنت
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      // 🗑 حذف المستند من Firestore
      await fireStoreService.deleteDocument(
        collection: "projects",
        docId: projectId,
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("حدث خطأ أثناء حذف المشروع: $e"));
    }
  }
}
