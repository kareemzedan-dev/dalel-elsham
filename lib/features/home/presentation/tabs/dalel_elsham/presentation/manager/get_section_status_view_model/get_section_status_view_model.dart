import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_case/dalel_al_sham_place_use_case/dalel_al_sham_place_use_case.dart';
import 'get_section_status_view_model_states.dart';
@injectable
class GetSectionStatusViewModel extends Cubit<GetSectionStatusViewModelStates> {
  final DalelAlShamPlaceUseCase dalelAlShamPlaceUseCase;

  GetSectionStatusViewModel({required this.dalelAlShamPlaceUseCase})
    : super(GetSectionStatusViewModelLoading());

  Future<void> getSectionStatus(String sectionId) async {
    emit(GetSectionStatusViewModelLoading());
    final result = await dalelAlShamPlaceUseCase.getSectionStatus(sectionId);
    result.fold(
      ifLeft: (failure) =>
          emit(GetSectionStatusViewModelError(message: failure.message)),
      ifRight: (success) =>
          emit(GetSectionStatusViewModelSuccess(isActive: success)),
    );
  }
}
