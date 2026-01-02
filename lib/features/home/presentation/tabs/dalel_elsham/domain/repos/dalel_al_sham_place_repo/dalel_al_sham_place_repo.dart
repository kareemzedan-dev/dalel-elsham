import 'package:dart_either/dart_either.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../../data/model/dalel_al_sham_place_model.dart';
import '../../entities/dalel_al_sham_place_entity.dart';

abstract class DalelAlShamPlaceRepo {
  Future<Either<Failures, List<DalelAlShamPlaceEntity>>> getAllPlaces();
  Future<Either<Failures, void>> addPlace(DalelAlShamPlaceModel place);
  Future<Either<Failures, void>> updatePlace(DalelAlShamPlaceModel place);
  Future<Either<Failures, void>> deletePlace(String id);

  /// ⭐ جديد: جلب حالة القسم (مفعّل ولا لا)
  Future<Either<Failures, bool>> getSectionStatus(String sectionId);
  Future<Either<Failures, List<DalelAlShamPlaceEntity>>> getAllPlacesByCategory(
      String categoryId,
      );

  Future<Either<Failures, List<Map<String, dynamic>>>> getAllCategories();
}
