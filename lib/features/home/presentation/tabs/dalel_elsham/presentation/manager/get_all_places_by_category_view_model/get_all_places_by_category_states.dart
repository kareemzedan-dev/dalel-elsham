import '../../../domain/entities/dalel_al_sham_place_entity.dart';

abstract class GetAllPlacesByCategoryStates {}
class GetAllPlacesByCategoryInitial extends GetAllPlacesByCategoryStates {}
class GetAllPlacesByCategoryLoading extends GetAllPlacesByCategoryStates {}
class GetAllPlacesByCategorySuccess extends GetAllPlacesByCategoryStates {
  final List<DalelAlShamPlaceEntity> places;

  GetAllPlacesByCategorySuccess({required this.places});
}
class GetAllPlacesByCategoryError extends GetAllPlacesByCategoryStates {
  final String message;

  GetAllPlacesByCategoryError({required this.message});
}