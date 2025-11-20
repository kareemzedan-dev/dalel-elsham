import 'package:dalel_elsham/features/home/presentation/tabs/dalel_elsham/presentation/manager/update_place_view_model/update_place_view_model_states.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../../data/model/dalel_al_sham_place_model.dart';
import '../../../domain/use_case/dalel_al_sham_place_use_case/dalel_al_sham_place_use_case.dart';
@injectable
class UpdatePlaceViewModel extends Cubit<UpdatePlaceViewModelStates> {
  final DalelAlShamPlaceUseCase dalelAlShamPlaceUseCase;

  UpdatePlaceViewModel({required this.dalelAlShamPlaceUseCase})
    : super(UpdatePlaceViewModelInitial());

  Future<Either<Failures, void>> updatePlace(DalelAlShamPlaceModel place) async {
    try {
      emit(UpdatePlaceViewModelLoading());
      final result = await dalelAlShamPlaceUseCase.updatePlace(place);
      result.fold(
        ifLeft: (failure) =>
            emit(UpdatePlaceViewModelError(error: failure.message)),
        ifRight: (success) => emit(UpdatePlaceViewModelSuccess()),
      );
      return result;
    } catch (e) {
      emit(UpdatePlaceViewModelError(error: e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }
}