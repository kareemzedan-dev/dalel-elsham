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
      // 🔹 التحقق من الانترنت
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      // 🔹 جلب المشاريع حسب الفئة
      final result = await fireStoreService.getWhere(
        collection: "projects",
        field: "categoryTitle",
        value: category,
      );

      // 🔥 فلترة المشاريع (approved + غير منتهية)
      final filtered = result.where((item) {
        final data = item["data"];

        if (data["status"] != "approved") return false;

        // 📌 createdAt
        final createdAt =
            DateTime.tryParse(data["createdAt"] ?? "") ?? DateTime(2000);

        // 📌 raw duration
        final rawDuration = data["duration"];

        // 📌 تحويل duration إلى رقم (لو رقم فقط)
        int? durationDays;

        if (rawDuration != null) {
          final extracted =
          RegExp(r'\d+').firstMatch(rawDuration.toString());
          if (extracted != null) {
            durationDays = int.parse(extracted.group(0)!);
          }
        }

        // 📌 هل المشروع منتهي؟
        bool isExpired = false;

        if (durationDays != null) {
          isExpired =
              DateTime.now().difference(createdAt).inDays >= durationDays!;
        }

        return !isExpired;
      }).toList();

      // 🔹 تحويل البيانات
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
