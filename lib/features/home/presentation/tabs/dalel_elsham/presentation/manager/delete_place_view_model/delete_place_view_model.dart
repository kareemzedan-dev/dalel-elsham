import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../../domain/use_case/dalel_al_sham_place_use_case/dalel_al_sham_place_use_case.dart';
import 'delete_place_view_model_states.dart';
@injectable
class DeletePlaceViewModel extends Cubit<DeletePlaceViewModelStates> {
  final DalelAlShamPlaceUseCase dalelAlShamPlaceUseCase;

  DeletePlaceViewModel({required this.dalelAlShamPlaceUseCase})
    : super(DeletePlaceViewModelInitial());

  Future<Either<Failures, void>> deletePlace(String id) async {
    try {
      emit(DeletePlaceViewModelLoading());
      final result = await dalelAlShamPlaceUseCase.deletePlace(id);
      result.fold(
        ifLeft: (failure) =>
            emit(DeletePlaceViewModelError(error: failure.message)),
        ifRight: (success) => emit(DeletePlaceViewModelSuccess()),
      );
      return result;
    } catch (e) {
      emit(DeletePlaceViewModelError(error: e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }
}
