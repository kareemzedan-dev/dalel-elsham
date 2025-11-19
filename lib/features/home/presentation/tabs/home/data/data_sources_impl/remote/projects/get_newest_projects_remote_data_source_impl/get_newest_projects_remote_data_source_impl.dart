import 'package:dalel_elsham/core/services/firebase_service.dart';
import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../../../core/helper/network_validation.dart';
import '../../../../../domain/entities/project_entity.dart';
import '../../../../data_sources/remote/projects/get_newest_projects_remote_data_source/get_newest_projects_remote_data_source.dart';
import '../../../../models/project_model.dart';
@Injectable(as: GetNewestProjectsRemoteDataSource)
class GetNewestProjectsRemoteDataSourceImpl
    implements GetNewestProjectsRemoteDataSource {
  final FirebaseService firebaseService;

  GetNewestProjectsRemoteDataSourceImpl(this.firebaseService);

  @override
  Future<Either<Failures, List<ProjectEntity>>> getNewestProjects() async {
    try {
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      /// 🟦 1. جلب المشاريع
      final data = await firebaseService.getCollection(collection: "projects");

      /// 🟦 2. تحويل الداتا إلى موديل
      final List<ProjectModel> models = data.map((map) {
        return ProjectModel.fromMap(map, map["id"]);
      }).toList();

      /// 🟦 3. ترتيبهم حسب تاريخ الإنشاء (الأحدث أولًا)
      models.sort((a, b) {
        final dateA = DateTime.tryParse(a.createdAt ?? "") ?? DateTime(2000);
        final dateB = DateTime.tryParse(b.createdAt ?? "") ?? DateTime(2000);
        return dateB.compareTo(dateA); // ترتيب تنازلي
      });

      /// 🟦 4. أخذ آخر 10 فقط
      final newest = models.take(10).toList();

      final List<ProjectEntity> entities = newest;

      return Right(entities);
    } catch (e) {
      return Left(ServerFailure("حدث خطأ: ${e.toString()}"));
    }
  }
}
