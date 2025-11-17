import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/use_cases/jobs_use_case/add_opportunity_usecase/add_opportunity_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/job_entity.dart';
import 'add_opportunity_view_model_states.dart';
@injectable
class AddOpportunityViewModel extends Cubit<AddOpportunityViewModelStates> {
  AddOpportunityUsecase addOpportunityUsecase ;
  AddOpportunityViewModel(this.addOpportunityUsecase) : super(AddOpportunityViewModelInitial());
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  Future<void> addOpportunity({required JobEntity job}) async {
    try {
      emit(AddOpportunityViewModelLoading());
      final result = await addOpportunityUsecase.addOpportunity(job);
      result.fold(
        ifLeft: (fail) => emit(AddOpportunityViewModelError(fail.message)),
        ifRight: (value) => emit(AddOpportunityViewModelSuccess()),
      );
    } catch (e) {
      emit(AddOpportunityViewModelError(e.toString()));
    }
  }
}