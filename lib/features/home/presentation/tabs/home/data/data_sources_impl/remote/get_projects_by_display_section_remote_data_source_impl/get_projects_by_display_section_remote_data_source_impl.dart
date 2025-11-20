import 'package:dalel_elsham/core/errors/failures.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/entities/project_entity.dart';
import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/helper/network_validation.dart';
import '../../../../../../../../../core/services/firebase_service.dart';
import '../../../data_sources/remote/projects/get_projects_by_display_section_remote_data_source/get_projects_by_display_section_remote_data_source.dart';
import '../../../models/project_model.dart';
@Injectable(as: GetProjectsByDisplaySectionRemoteDataSource)
class GetProjectsByDisplaySectionRemoteDataSourceImpl
    implements GetProjectsByDisplaySectionRemoteDataSource {
  final FirebaseService fireStoreService;

  GetProjectsByDisplaySectionRemoteDataSourceImpl(this.fireStoreService);

  @override
  Future<Either<Failures, List<ProjectEntity>>> getProjectsByDisplaySection(
    String displaySectionId,
  ) async {
    try {
      /// فحص الإنترنت
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      /// 🔵 جلب المشاريع اللي الـ displaySections تبعها يحتوي الـ ID المطلوب
      final List<Map<String, dynamic>> rawData = await fireStoreService
          .getWhereArrayContains(
            collection: "projects",
            field: "displaySections",
            value: displaySectionId,
          );

      /// 🔵 تحويل الـ Map إلى ProjectModel ثم إلى ProjectEntity
      final List<ProjectEntity> projects = rawData.map((data) {
        return ProjectModel.fromMap(data, data['id'] ?? "");
      }).toList();

      return Right(projects);
    } catch (e) {
      return Left(ServerFailure("حدث خطأ أثناء جلب المشاريع: $e"));
    }
  }
}
