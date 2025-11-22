import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/entities/job_entity.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/jobs/add_opportunity_view_model/add_opportunity_view_model.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/jobs/add_opportunity_view_model/add_opportunity_view_model_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../../core/components/ad_duration_selector.dart';
import '../../../../../../../core/components/custom_button.dart';
import '../../../../../../../core/components/custom_text_field.dart';
import '../../../../../../../core/components/mobile_number_field.dart';
import '../../../../../../../core/utils/duration_mapper.dart';
import '../../../../../../../core/validators/job_validators.dart';
import 'form_section_field.dart';

class JobOfferFormViewBody extends StatelessWidget {
  const JobOfferFormViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final vm = context.read<AddOpportunityViewModel>();

    // -------------------------------
    // validate duration
    bool validateDuration(BuildContext c) {
      final text = vm.durationController.text.trim();
      if (text.isEmpty) {
        ScaffoldMessenger.of(c).showSnackBar(
          const SnackBar(content: Text("من فضلك اختر مدة الإعلان")),
        );
        return false;
      }

      final days = mapDurationToDays(text);
      if (days <= 0) {
        ScaffoldMessenger.of(c).showSnackBar(
          const SnackBar(content: Text("مدة غير صالحة")),
        );
        return false;
      }
      return true;
    }

    // -------------------------------
    Future<void> _onSubmit(BuildContext c) async {
      if (!formKey.currentState!.validate()) return;

      if (!validateDuration(c)) return;

      vm.addOpportunity(
        job: JobEntity(
          id: const Uuid().v4(),
          title: vm.titleController.text.trim(),
          description: vm.descriptionController.text.trim(),
          type: "normal",
          phone: vm.phoneController.text.trim(),
          location: vm.locationController.text.trim(),
          imageUrl: "",
          isActive: true,
          status: "pending",
          duration: mapDurationToDays(vm.durationController.text.trim()),
          createdAt: DateTime.now(),
        ),
      );
    }

    // -------------------------------------------------
    return BlocConsumer<AddOpportunityViewModel, AddOpportunityViewModelStates>(
      listener: (context, state) {
        if (state is AddOpportunityViewModelSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("تم إضافة الوظيفة بنجاح")),
          );
          Navigator.pop(context);
        }

        if (state is AddOpportunityViewModelError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },

      builder: (context, state) {
        final isLoading = state is AddOpportunityViewModelLoading;

        return Stack(
          children: [
            // ---------------------- UI ----------------------
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),

                      FormSectionField(
                        label: "نوع العمل المتاح لديك",
                        child: CustomTextFormField(
                          hintText: "اكتب نوع العمل أو المسمّى الوظيفي",
                          textEditingController: vm.titleController,
                          validator: JobValidators.validateTitle,
                          keyboardType: TextInputType.text,
                        ),
                      ),

                      FormSectionField(
                        label: "أشرح عن الوظيفة",
                        child: CustomTextFormField(
                          hintText: "اكتب وصفًا مختصرًا عن الوظيفة",
                          keyboardType: TextInputType.text,
                          maxLines: 4,
                          textEditingController: vm.descriptionController,
                          validator: JobValidators.validateDescription,
                        ),
                      ),

                      FormSectionField(
                        label: "رقم الهاتف",
                        child: MobileNumberField(
                          controller: vm.phoneController,
                          validator: JobValidators.validatePhone,
                        ),
                      ),

                      FormSectionField(
                        label: "الموقع",
                        child: CustomTextFormField(
                          hintText: "دمشق",
                          keyboardType: TextInputType.text,
                          textEditingController: vm.locationController,
                          validator: JobValidators.validateLocation,
                        ),
                      ),

                      FormSectionField(
                        label: "مدة الإعلان",
                        child: AdDurationSelector(
                          onSelect: (value) {
                            vm.durationController.text = value;
                          },
                        ),
                      ),

                      SizedBox(height: 40.h),

                      CustomButton(
                        text: isLoading ? "جاري الإرسال..." : "أضف وظيفة",
                        onPressed:
                        isLoading ? () {} : () => _onSubmit(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ------------------ FULL PAGE LOADING ------------------
            if (isLoading)
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black.withOpacity(0.3),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        );
      },
    );
  }
}
