import 'package:dalel_elsham/features/home/presentation/tabs/dalel_elsham/domain/use_case/dalel_al_sham_place_use_case/dalel_al_sham_place_use_case.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../../domain/entities/dalel_al_sham_place_entity.dart';
import 'get_all_places_by_category_states.dart';
@injectable
class GetAllPlacesByCategoryViewModel
    extends Cubit<GetAllPlacesByCategoryStates> {
  final DalelAlShamPlaceUseCase dalelAlShamPlaceUseCase;

  GetAllPlacesByCategoryViewModel(this.dalelAlShamPlaceUseCase)
    : super(GetAllPlacesByCategoryInitial());

  Future<Either<Failures, List<DalelAlShamPlaceEntity>>> getAllPlacesByCategory(String categoryId) async {
    try {
      emit(GetAllPlacesByCategoryLoading());
      final result = await dalelAlShamPlaceUseCase.getAllPlacesByCategory(
        categoryId,
      );
      result.fold(
        ifLeft: (failure) =>
            emit(GetAllPlacesByCategoryError(message: failure.message)),
        ifRight: (success) =>
            emit(GetAllPlacesByCategorySuccess(places: success)),
      );
      return result ;
    } on Exception catch (e) {
      emit(GetAllPlacesByCategoryError(message: e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }
}
