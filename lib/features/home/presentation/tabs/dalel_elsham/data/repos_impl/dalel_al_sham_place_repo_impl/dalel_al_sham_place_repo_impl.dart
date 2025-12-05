import 'package:dalel_elsham/core/errors/failures.dart';

import 'package:dalel_elsham/features/home/presentation/tabs/dalel_elsham/data/model/dalel_al_sham_place_model.dart';

import 'package:dalel_elsham/features/home/presentation/tabs/dalel_elsham/domain/entities/dalel_al_sham_place_entity.dart';

import 'package:dart_either/src/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repos/dalel_al_sham_place_repo/dalel_al_sham_place_repo.dart';
import '../../data_sources/remote/dalel_al_sham_place_remote_data_source/dalel_al_sham_place_remote_data_source.dart';

@Injectable(as: DalelAlShamPlaceRepo)
class DalelAlShamPlaceRepoImpl implements DalelAlShamPlaceRepo {
  final DalelAlShamPlaceRemoteDataSource dalelAlShamPlaceRemoteDataSource;

  DalelAlShamPlaceRepoImpl({required this.dalelAlShamPlaceRemoteDataSource});

  @override
  Future<Either<Failures, void>> addPlace(DalelAlShamPlaceModel place) {
    return dalelAlShamPlaceRemoteDataSource.addPlace(place);
  }

  @override
  Future<Either<Failures, void>> deletePlace(String id) {
    return dalelAlShamPlaceRemoteDataSource.deletePlace(id);
  }

  @override
  Future<Either<Failures, List<DalelAlShamPlaceEntity>>> getAllPlaces() {
    return dalelAlShamPlaceRemoteDataSource.getAllPlaces();
  }

  @override
  Future<Either<Failures, void>> updatePlace(DalelAlShamPlaceModel place) {
    return dalelAlShamPlaceRemoteDataSource.updatePlace(place);
  }

  @override
  Future<Either<Failures, bool>> getSectionStatus(String sectionId) {
    return dalelAlShamPlaceRemoteDataSource.getSectionStatus(sectionId);
  }


}
