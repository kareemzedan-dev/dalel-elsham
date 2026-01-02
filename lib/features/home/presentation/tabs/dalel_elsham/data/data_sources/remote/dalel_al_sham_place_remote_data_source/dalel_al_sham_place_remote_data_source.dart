import 'package:dart_either/dart_either.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/dalel_al_sham_place_entity.dart';
import '../../../model/dalel_al_sham_place_model.dart';



abstract class DalelAlShamPlaceRemoteDataSource {
  Future<Either<Failures, List<DalelAlShamPlaceEntity>>> getAllPlaces();
  Future<Either<Failures, void>> addPlace(DalelAlShamPlaceModel place);
  Future<Either<Failures, void>> updatePlace(DalelAlShamPlaceModel place);
  Future<Either<Failures, void>> deletePlace(String id);
  Future<Either<Failures, bool>> getSectionStatus(String sectionId);
  Future<Either<Failures, List<DalelAlShamPlaceEntity>>> getAllPlacesByCategory(String categoryId);
  Future<Either<Failures, List<Map<String, dynamic>>>> getAllCategories();

}