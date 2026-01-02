import 'package:dalel_elsham/core/enums/contact_method.dart';
import 'package:dalel_elsham/core/services/notification_service.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/use_cases/jobs_use_case/add_opportunity_usecase/add_opportunity_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/job_entity.dart';
import 'add_opportunity_view_model_states.dart';

@injectable
class AddOpportunityViewModel extends Cubit<AddOpportunityViewModelStates> {
  AddOpportunityUsecase addOpportunityUsecase;

  AddOpportunityViewModel(this.addOpportunityUsecase)
      : super(AddOpportunityViewModelInitial());

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController durationController = TextEditingController();
final TextEditingController applyLinkController = TextEditingController();

ContactMethod contactMethod = ContactMethod.phone;
  Future<void> addOpportunity({required JobEntity job}) async {
    try {
      emit(AddOpportunityViewModelLoading());

      final result = await addOpportunityUsecase.addOpportunity(job);

      result.fold(
        ifLeft: (fail) => emit(AddOpportunityViewModelError(fail.message)),
        ifRight: (value) async {
          emit(AddOpportunityViewModelSuccess());

          // 🔥 إرسال إشعار لكل الأدمنز
          await NotificationService.sendToAllAdmins(
            title: "فرصة جديدة",
            message: "تم إضافة فرصة: ${job.title}",
          );
        },
      );
    } catch (e) {
      emit(AddOpportunityViewModelError(e.toString()));
    }
  }
}
