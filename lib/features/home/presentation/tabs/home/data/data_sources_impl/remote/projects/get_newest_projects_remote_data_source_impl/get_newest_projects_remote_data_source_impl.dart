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
      // 🔹 فحص الإنترنت
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      // 🔹 جلب كل المشاريع
      final data = await firebaseService.getCollection(collection: "projects");

      // 🔹 تحويلها إلى Models
      final List<ProjectModel> models = data.map((map) {
        return ProjectModel.fromMap(map, map["id"]);
      }).toList();

      // 🔹 فلترة approved + غير منتهية
      final filtered = models.where((p) {
        if (p.status != "approved") return false;

        final createdAt =
            DateTime.tryParse(p.createdAt ?? "") ?? DateTime(2000);

        // ⬅ durationDays nullable — بدون fallback 7
        int? durationDays;

        if (p.duration != null) {
          final match = RegExp(r'\d+').firstMatch(p.duration.toString());
          if (match != null) {
            durationDays = int.parse(match.group(0)!);
          }
        }

        // ⬅ تحديد هل منتهي
        bool isExpired = false;

        // لو فيها رقم → احسب
        if (durationDays != null) {
          isExpired =
              DateTime.now().difference(createdAt).inDays >= durationDays!;
        }

        // لو مفيش رقم → المشروع مش منتهي
        return !isExpired;
      }).toList();

      // 🔹 ترتيب من الأحدث للأقدم
      filtered.sort((a, b) {
        final dateA = DateTime.tryParse(a.createdAt ?? "") ?? DateTime(2000);
        final dateB = DateTime.tryParse(b.createdAt ?? "") ?? DateTime(2000);
        return dateB.compareTo(dateA);
      });

      // 🔹 أخذ أحدث 10
      final newest = filtered.take(10).toList();

      return Right(newest);

    } catch (e) {
      return Left(ServerFailure("حدث خطأ: ${e.toString()}"));
    }
  }
}
