import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../../../core/helper/network_validation.dart';
import '../../../../../../../../../../core/services/firebase_service.dart';
import '../../../../../domain/entities/project_entity.dart';
import '../../../../data_sources/remote/projects/get_projects_by_category_remote_data_source/get_projects_by_category_remote_data_source.dart';
import '../../../../models/project_model.dart';


@Injectable(as: GetProjectsByCategoryRemoteDataSource)
class GetProjectsByCategoryRemoteDataSourceImpl
    implements GetProjectsByCategoryRemoteDataSource {

  final FirebaseService fireStoreService;

  GetProjectsByCategoryRemoteDataSourceImpl(this.fireStoreService);

  @override
  Future<Either<Failures, List<ProjectEntity>>> getProjectsByCategory(
      String category) async {
    try {
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      final result = await fireStoreService.getWhere(
        collection: "projects",
        field: "categoryTitle",
        value: category,
      );

      // 🔥 فلترة المشاريع المعتمدة فقط
      final approvedOnly = result.where((item) {
        final data = item["data"];
        return data["status"] == "approved";
      }).toList();

      final List<ProjectEntity> projects = approvedOnly.map((item) {
        return ProjectModel.fromMap(item["data"], item["id"]);
      }).toList();

      return Right(projects);

    } catch (e) {
      print("🔥🔥 ERROR => $e");
      return Left(ServerFailure("فشل في جلب المشاريع حسب الفئة: $e"));
    }
  }
}
