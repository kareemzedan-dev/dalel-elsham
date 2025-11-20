import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../../domain/entities/dalel_al_sham_place_entity.dart';
import '../../../domain/use_case/dalel_al_sham_place_use_case/dalel_al_sham_place_use_case.dart';
import 'get_all_place_view_model_states.dart';

@injectable
class GetAllPlaceViewModel extends Cubit<GetAllPlaceViewModelStates> {
  final DalelAlShamPlaceUseCase dalelAlShamPlaceUseCase;

  GetAllPlaceViewModel({required this.dalelAlShamPlaceUseCase})
    : super(GetAllPlaceViewModelInitial());

  Future<Either<Failures, List<DalelAlShamPlaceEntity>>> getAllPlaces() async {
    try {
      emit(GetAllPlaceViewModelLoading());
      final result = await dalelAlShamPlaceUseCase.getAllPlaces();
      result.fold(
        ifLeft: (failure) =>
            emit(GetAllPlaceViewModelError(error: failure.message)),
        ifRight: (success) =>
            emit(GetAllPlaceViewModelSuccess(places: success)),
      );
      return result;
    } catch (e) {
      emit(GetAllPlaceViewModelError(error: e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }
}
