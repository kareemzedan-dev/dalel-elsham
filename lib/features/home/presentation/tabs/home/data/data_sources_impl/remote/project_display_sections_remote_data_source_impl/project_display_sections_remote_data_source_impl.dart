import 'package:dalel_elsham/core/errors/failures.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/entities/project_display_section_entity.dart';
import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/helper/network_validation.dart';
import '../../../../../../../../../core/services/firebase_service.dart';
import '../../../data_sources/remote/project_display_sections_remote_data_source/project_display_sections_remote_data_source.dart';
@Injectable(as: ProjectDisplaySectionsRemoteDataSource)
class ProjectDisplaySectionsRemoteDataSourceImpl
    implements ProjectDisplaySectionsRemoteDataSource {

  final FirebaseService firebaseService;

  ProjectDisplaySectionsRemoteDataSourceImpl({
    required this.firebaseService,
  });

  /// ================================
  /// 🔵 Add New Section
  /// ================================
  @override
  Future<Either<Failures, void>> addProjectDisplaySection(
      ProjectDisplaySectionEntity section,
      ) async {
    try {
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      await firebaseService.addDocument(
        collection: "project_display_sections",
        data: {
          "id": section.id,
          "title": section.title,
          "order": section.order,
          "isActive": section.isActive,
          "createdAt": section.createdAt.toIso8601String(),
        },
        docId: section.id,
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("فشل إضافة القسم: $e"));
    }
  }

  /// ================================
  /// 🔵 Delete Section
  /// ================================
  @override
  Future<Either<Failures, void>> deleteProjectDisplaySection(String id) async {
    try {
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      await firebaseService.deleteDocument(
        collection: "project_display_sections",
        docId: id,
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("فشل حذف القسم: $e"));
    }
  }

  /// ================================
  /// 🔵 Get All Sections
  /// ================================
  @override
  Future<Either<Failures, List<ProjectDisplaySectionEntity>>>
  getAllProjectDisplaySections() async {
    try {
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      final data = await firebaseService.getCollection(
        collection: "project_display_sections",
      );

      final sections = data.map((item) {
        return ProjectDisplaySectionEntity(
          id: item["id"],
          title: item["title"],
          order: item["order"],
          isActive: item["isActive"],
          createdAt: DateTime.parse(item["createdAt"]),
        );
      }).toList();

      return Right(sections);
    } catch (e) {
      return Left(ServerFailure("فشل جلب الأقسام: $e"));
    }
  }

  /// ================================
  /// 🔵 Update Section
  /// ================================
  @override
  Future<Either<Failures, void>> updateProjectDisplaySection(
      ProjectDisplaySectionEntity section,
      ) async {
    try {
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      await firebaseService.updateDocument(
        collection: "project_display_sections",
        docId: section.id,
        data: {
          "title": section.title,
          "order": section.order,
          "isActive": section.isActive,
          "createdAt": section.createdAt.toIso8601String(),
        },
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("فشل تحديث القسم: $e"));
    }
  }
}
