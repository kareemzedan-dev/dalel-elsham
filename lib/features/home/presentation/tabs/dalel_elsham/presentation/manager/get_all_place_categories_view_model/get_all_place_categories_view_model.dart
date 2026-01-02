import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../../../home/presentation/manager/categories/get_all_categories_view_model/get_all_categories_view_model_states.dart';
import '../../../domain/use_case/dalel_al_sham_place_use_case/dalel_al_sham_place_use_case.dart';
import 'get_all_place_categories_view_model_states.dart';
@injectable
class GetAllPlaceCategoriesViewModel
    extends Cubit<GetAllPlaceCategoriesViewModelStates> {
  final DalelAlShamPlaceUseCase dalelAlShamPlaceUseCase;

  GetAllPlaceCategoriesViewModel({required this.dalelAlShamPlaceUseCase})
    : super(GetAllPlaceCategoriesViewModelStatesInitial());

  Future<Either<Failures, void>> getAllCategories() async {
    try {
      emit(GetAllPlaceCategoriesViewModelStatesLoading());
      final result = await dalelAlShamPlaceUseCase.getAllCategories();
      result.fold(
        ifLeft: (failure) => emit(
          GetAllPlaceCategoriesViewModelStatesError(message: failure.message),
        ),
        ifRight: (categories) {
          categories.sort(
                (a, b) => (a["index"] as int).compareTo(b["index"] as int),
          );

          emit(
            GetAllPlaceCategoriesViewModelStatesSuccess(
              categories: categories,
            ),
          );
        },


      );
      return result;
    } catch (e) {
      emit(GetAllPlaceCategoriesViewModelStatesError(message: e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }
}
