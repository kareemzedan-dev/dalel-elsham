import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../../core/helper/network_validation.dart';
import '../../../../../../../../../core/services/firebase_service.dart';
import '../../../../domain/entities/dalel_al_sham_place_entity.dart';
import '../../../data_sources/remote/dalel_al_sham_place_remote_data_source/dalel_al_sham_place_remote_data_source.dart';
import '../../../model/dalel_al_sham_place_model.dart';
@Injectable(as: DalelAlShamPlaceRemoteDataSource)
class DalelAlShamPlaceRemoteDataSourceImpl
    implements DalelAlShamPlaceRemoteDataSource {

  final FirebaseService firebaseService;

  DalelAlShamPlaceRemoteDataSourceImpl({required this.firebaseService});

  @override
  Future<Either<Failures, void>> addPlace(DalelAlShamPlaceModel place) async {
    try {
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      await firebaseService.addDocument(
        collection: "dalel_al_sham_places",
        docId: place.id,
        data: place.toMap(),
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("خطأ أثناء إضافة المكان: $e"));
    }
  }

  @override
  Future<Either<Failures, void>> updatePlace(DalelAlShamPlaceModel place) async {
    try {
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      await firebaseService.updateDocument(
        collection: "dalel_al_sham_places",
        docId: place.id,
        data: place.toMap(),
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("خطأ أثناء تحديث بيانات المكان: $e"));
    }
  }

  @override
  Future<Either<Failures, void>> deletePlace(String id) async {
    try {
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      await firebaseService.deleteDocument(
        collection: "dalel_al_sham_places",
        docId: id,
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("خطأ أثناء حذف المكان: $e"));
    }
  }

  @override
  Future<Either<Failures, List<DalelAlShamPlaceEntity>>> getAllPlaces() async {
    try {
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      final data = await firebaseService.getCollection(
        collection: "dalel_al_sham_places",
      );

      final places = data.map((item) {
        return DalelAlShamPlaceModel.fromMap(item, item["id"]);
      }).toList();

      return Right(places);
    } catch (e) {
      return Left(ServerFailure("خطأ أثناء جلب الأماكن: $e"));
    }
  }
}
