import 'package:dalel_elsham/core/services/firebase_service.dart';
import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../../../core/helper/network_validation.dart';
import '../../../../../domain/entities/project_entity.dart';
import '../../../../data_sources/remote/projects/add_project_remote_data_source/add_project_remote_data_source.dart';
import '../../../../models/project_model.dart';
@Injectable(as: AddProjectRemoteDataSource)
class AddProjectRemoteDataSourceImpl implements AddProjectRemoteDataSource {
  final FirebaseService fireStoreService;

  AddProjectRemoteDataSourceImpl(this.fireStoreService);

  @override
  Future<Either<Failures, void>> addProject(ProjectEntity project) async {
    try {
      // 🔹 1) تحقق من الإنترنت
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      // 🔹 2) تحويل الـ Entity إلى Model
      final model = ProjectModel(
        id: project.id,
        title: project.title,
        description: project.description,
        categoryTitle: project.categoryTitle,
        phone: project.phone,
        logo: project.logo,
        location: project.location,
        isActive: project.isActive,
        duration: project.duration,
        tier: project.tier,
        createdAt: project.createdAt,
        status: project.status,
        images: project.images,
        additionalImages: project.additionalImages,
      );

      // 🔹 3) حفظ البيانات في Firestore
      await fireStoreService.addDocument(
        collection: "projects",
        docId: model.id,
        data: model.toMap(),
      );

      // 🔹 4) نجاح
      return const Right(null);

    } catch (e) {
      // 🔥 لو حصل أي خطأ يرجع Failure مناسب
      return Left(ServerFailure("فشل في إضافة المشروع: $e"));
    }
  }
}
