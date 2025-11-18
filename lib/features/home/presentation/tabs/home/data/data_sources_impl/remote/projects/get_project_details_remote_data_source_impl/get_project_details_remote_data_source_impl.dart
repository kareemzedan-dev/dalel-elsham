import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../../../core/helper/network_validation.dart';
import '../../../../../../../../../../core/services/firebase_service.dart';
import '../../../../../domain/entities/project_entity.dart';
import '../../../../data_sources/remote/projects/get_project_details_remote_data_source/get_project_details_remote_data_source.dart';
import '../../../../models/project_model.dart';
@Injectable(as: GetProjectDetailsRemoteDataSource)
class GetProjectDetailsRemoteDataSourceImpl
    implements GetProjectDetailsRemoteDataSource {
  final FirebaseService fireStoreService;

  GetProjectDetailsRemoteDataSourceImpl(this.fireStoreService);

  @override
  Future<Either<Failures, ProjectEntity>> getProjectDetails(
      String projectId) async {
    try {
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      final data = await fireStoreService.getDocument(
        collection: "projects",
        docId: projectId,
      );

      if (data == null) {
        return Left(ServerFailure("هذا المشروع غير موجود"));
      }

      final project = ProjectModel.fromMap(data, projectId);

      return Right(project);
    } catch (e) {
      return Left(ServerFailure("فشل في جلب تفاصيل المشروع: $e"));
    }
  }
}
