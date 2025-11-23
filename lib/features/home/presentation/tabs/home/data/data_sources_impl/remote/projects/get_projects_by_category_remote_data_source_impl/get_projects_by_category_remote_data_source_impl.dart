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

      // 🔥 فلترة المشاريع المعتمدة + اللي مدتها لسه ما خلصتش
      final filtered = result.where((item) {
        final data = item["data"];

        final isApproved = data["status"] == "approved";

        // 🔹 createdAt
        final createdAt = DateTime.tryParse(data["createdAt"] ?? "") ?? DateTime(2000);

        // 🔹 duration من Firebase
        final rawDuration = data["duration"];

        // 🟦 تحويل الـ duration لأي فورمات متوقعة
        int durationDays = 7; // default fallback

        if (rawDuration != null) {
          // لو duration مكتوبة "7 days"
          final extracted = RegExp(r'\d+').firstMatch(rawDuration.toString());
          if (extracted != null) {
            durationDays = int.parse(extracted.group(0)!);
          }
        }

        // 🔥 هل انتهت مدة المشروع؟
        final isExpired = DateTime.now().difference(createdAt).inDays >= durationDays;

        return isApproved && !isExpired;
      }).toList();

      final List<ProjectEntity> projects = filtered.map((item) {
        return ProjectModel.fromMap(item["data"], item["id"]);
      }).toList();

      return Right(projects);

    } catch (e) {
      print("🔥🔥 ERROR => $e");
      return Left(ServerFailure("فشل في جلب المشاريع حسب الفئة: $e"));
    }
  }
}
