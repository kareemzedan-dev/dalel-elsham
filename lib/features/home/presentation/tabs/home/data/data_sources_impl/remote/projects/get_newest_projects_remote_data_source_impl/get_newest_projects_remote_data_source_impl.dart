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

      /// 🟦 1. جلب جميع المشاريع
      final data = await firebaseService.getCollection(collection: "projects");

      /// 🟦 2. تحويلها إلى Models
      final List<ProjectModel> models = data.map((map) {
        return ProjectModel.fromMap(map, map["id"]);
      }).toList();

      /// 🟦 3. فلترة الـ approved + غير المنتهية
      final filtered = models.where((p) {
        // ✔ لازم Approved
        if (p.status != "approved") return false;

        // ✔ نحول createdAt
        final createdAt = DateTime.tryParse(p.createdAt ?? "") ?? DateTime(2000);

        // ✔ استخراج عدد الأيام من duration
        int durationDays = 7; // fallback

        if (p.duration != null) {
          final match = RegExp(r'\d+').firstMatch(p.duration.toString());
          if (match != null) {
            durationDays = int.parse(match.group(0)!);
          }
        }

        // ✔ حساب هل انتهى أم لا
        final isExpired =
            DateTime.now().difference(createdAt).inDays >= durationDays;

        return !isExpired;
      }).toList();

      /// 🟦 4. ترتيبهم حسب الجديد → القديم
      filtered.sort((a, b) {
        final dateA = DateTime.tryParse(a.createdAt ?? "") ?? DateTime(2000);
        final dateB = DateTime.tryParse(b.createdAt ?? "") ?? DateTime(2000);
        return dateB.compareTo(dateA);
      });

      /// 🟦 5. أخذ آخر 10 فقط
      final newest = filtered.take(10).toList();

      return Right(newest);

    } catch (e) {
      return Left(ServerFailure("حدث خطأ: ${e.toString()}"));
    }
  }
}
