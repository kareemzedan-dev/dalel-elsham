import 'package:dalel_elsham/core/services/notification_service.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/use_cases/jobs_use_case/add_job_usecase/add_job_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/job_entity.dart';
import 'add_job_view_model_states.dart';

@injectable
class AddJobViewModel extends Cubit<AddJobViewModelStates> {
  AddJobUsecase addJobUsecase;

  AddJobViewModel(this.addJobUsecase) : super(AddJobViewModelInitial());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  Future<void> addJob({required JobEntity job}) async {
    try {
      emit(AddJobViewModelLoading());

      final result = await addJobUsecase.addJob(job);

      result.fold(
        ifLeft: (fail) {
          emit(AddJobViewModelError(fail.message));
        },
        ifRight: (value) async {
          emit(AddJobViewModelSuccess());

          // 🔥 إرسال إشعار للأدمنز بعد نجاح الإضافة
          await NotificationService.sendToAllAdmins(
            title: "فرصة عمل جديدة",
            message: "تم إضافة وظيفة: ${job.title}",
          );
        },
      );
    } catch (e) {
      emit(AddJobViewModelError(e.toString()));
    }
  }
}
