import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../../data/model/dalel_al_sham_place_model.dart';
import '../../entities/dalel_al_sham_place_entity.dart';
import '../../repos/dalel_al_sham_place_repo/dalel_al_sham_place_repo.dart';
@injectable
 class DalelAlShamPlaceUseCase {
   final DalelAlShamPlaceRepo dalelAlShamPlaceRepo;
   DalelAlShamPlaceUseCase({required this.dalelAlShamPlaceRepo});
   Future<Either<Failures, List<DalelAlShamPlaceEntity>>> getAllPlaces() async {
    return await dalelAlShamPlaceRepo.getAllPlaces();
   }

   Future<Either<Failures, void>> addPlace(DalelAlShamPlaceModel place) async {
    return await dalelAlShamPlaceRepo.addPlace(place);
   }

   Future<Either<Failures, void>> updatePlace(DalelAlShamPlaceModel place) async {
    return await dalelAlShamPlaceRepo.updatePlace(place);
   }

   Future<Either<Failures, void>> deletePlace(String id) async {
    return await dalelAlShamPlaceRepo.deletePlace(id);
   }
   Future<Either<Failures, bool>> getSectionStatus(String sectionId) async {
    return await dalelAlShamPlaceRepo.getSectionStatus(sectionId);
   }

 }