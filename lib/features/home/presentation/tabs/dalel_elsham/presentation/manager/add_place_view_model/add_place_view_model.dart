import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../../data/model/dalel_al_sham_place_model.dart';
import '../../../domain/use_case/dalel_al_sham_place_use_case/dalel_al_sham_place_use_case.dart';
import 'add_place_view_model_states.dart';
@injectable
class AddPlaceViewModel extends Cubit<AddPlaceViewModelStates> {
  final DalelAlShamPlaceUseCase dalelAlShamPlaceUseCase;

  AddPlaceViewModel({required this.dalelAlShamPlaceUseCase})
    : super(AddPlaceViewModelInitial());

  Future<Either<Failures, void>> addPlace(DalelAlShamPlaceModel place) async {
    try {
      emit(AddPlaceViewModelLoading());
      final result = await dalelAlShamPlaceUseCase.addPlace(place);
      result.fold(
        ifLeft: (failure) =>
            emit(AddPlaceViewModelError(error: failure.message)),
        ifRight: (success) => emit(AddPlaceViewModelSuccess()),
      );
      return result;
    } catch (e) {
      emit(AddPlaceViewModelError(error: e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }
}
