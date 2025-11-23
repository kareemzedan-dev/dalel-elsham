import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../../../core/helper/network_validation.dart';
import '../../../../../../../../../../core/services/firebase_service.dart';
import '../../../../../domain/entities/project_entity.dart';
import '../../../../data_sources/remote/projects/get_all_projects_remote_data_source/get_all_projects_remote_data_source.dart';
import '../../../../models/project_model.dart';
@Injectable(as: GetAllProjectsRemoteDataSource)
class GetAllProjectsRemoteDataSourceImpl
    implements GetAllProjectsRemoteDataSource {

  final FirebaseService fireStoreService;

  GetAllProjectsRemoteDataSourceImpl(this.fireStoreService);

  @override
  Future<Either<Failures, List<ProjectEntity>>> getAllProjects() async {
    try {
      // 1) فحص الاتصال بالإنترنت
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      // 2) جلب البيانات من Firestore
      final List<Map<String, dynamic>> rawData =
      await fireStoreService.getCollection(collection: "projects");

      // 3) فلترة المشاريع (approved + غير منتهية)
      final filtered = rawData.where((item) {
        final status = item["status"];
        if (status != "approved") return false;

        // createdAt
        final createdAt = DateTime.tryParse(item["createdAt"] ?? "") ??
            DateTime(2000);

        // duration
        int durationDays = 7; // fallback

        if (item["duration"] != null) {
          final match = RegExp(r'\d+').firstMatch(item["duration"].toString());
          if (match != null) {
            durationDays = int.parse(match.group(0)!);
          }
        }

        // هل المشروع منتهي؟
        final isExpired =
            DateTime.now().difference(createdAt).inDays >= durationDays;

        return !isExpired;
      }).toList();

      // 4) تحويل البيانات
      final projects = filtered.map((data) {
        return ProjectModel.fromMap(
          data,
          data['id'] ?? "",
        );
      }).toList();

      return Right(projects);

    } catch (e) {
      return Left(ServerFailure("حدث خطأ أثناء جلب المشاريع: $e"));
    }
  }
}

