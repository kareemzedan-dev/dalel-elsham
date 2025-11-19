import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../../core/helper/network_validation.dart';
import '../../../../../../../../../core/services/firebase_service.dart';
import '../../../../domain/entities/app_link_entity.dart';
import '../../../data_sources/remote/app_links_remote_data_source/app_links_remote_data_source.dart';
import '../../../models/app_link_model.dart';
@Injectable(as: AppLinksRemoteDataSource)
class AppLinksRemoteDataSourceImpl implements AppLinksRemoteDataSource {
  final FirebaseService firebaseService;

  AppLinksRemoteDataSourceImpl(this.firebaseService);

  /// ------------------------------------------------------------------------
  /// 🔵 1) GET ALL LINKS
  /// ------------------------------------------------------------------------
  @override
  Future<Either<Failures, List<AppLinkEntity>>> getAllAppLinks() async {
    try {
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      final result = await firebaseService.getCollection(
        collection: "app_links",
      );

      final List<AppLinkEntity> links = result.map((map) {
        return AppLinkModel.fromMap(map, map['id'] ?? "");
      }).toList();

      return Right(links);
    } catch (e) {
      return Left(ServerFailure("حدث خطأ أثناء جلب الروابط: $e"));
    }
  }

  /// ------------------------------------------------------------------------
  /// 🔵 2) ADD OR UPDATE LINK
  /// ------------------------------------------------------------------------
  @override
  Future<Either<Failures, void>> addOrUpdateLink(AppLinkEntity appLink) async {
    try {
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      final model = AppLinkModel(
        id: appLink.id,
        type: appLink.type,
        title: appLink.title,
        url: appLink.url,
        updatedAt: DateTime.now(),
      );

      /// لو الرابط جديد → أضفه
      if (appLink.id.isEmpty) {
        await firebaseService.addDocument(
          collection: "app_links",
          data: model.toMap(),
        );
      }
      /// لو الرابط قديم → حدّثه
      else {
        await firebaseService.updateDocument(
          collection: "app_links",
          docId: appLink.id,
          data: model.toMap(),
        );
      }

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("تعذّر حفظ الرابط: $e"));
    }
  }
}
