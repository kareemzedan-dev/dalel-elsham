import '../../../domain/entities/dalel_al_sham_place_entity.dart';

abstract class GetAllPlaceViewModelStates {}

class GetAllPlaceViewModelInitial extends GetAllPlaceViewModelStates {}

class GetAllPlaceViewModelLoading extends GetAllPlaceViewModelStates {}

class GetAllPlaceViewModelSuccess extends GetAllPlaceViewModelStates {
  final List<DalelAlShamPlaceEntity> places;
  GetAllPlaceViewModelSuccess({required this.places});
}

class GetAllPlaceViewModelError extends GetAllPlaceViewModelStates {
  final String error;
  GetAllPlaceViewModelError({required this.error});
}
