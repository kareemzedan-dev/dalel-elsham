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
import 'form_section_field.dart';

class JobOfferFormViewBody extends StatelessWidget {
  const JobOfferFormViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOpportunityViewModel, AddOpportunityViewModelStates>(
      listener: (context, state) {
        if (state is AddOpportunityViewModelSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("تم إضافة الوظيفة بنجاح")),
          );
          Navigator.pop(context);
        }

        if (state is AddOpportunityViewModelError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },

      builder: (context, state) {
        final vm = context.read<AddOpportunityViewModel>();

        return Stack(
          children: [
            /// ----------- UI الأساسي ----------- ///
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 10.h),

                    FormSectionField(
                      label: "نوع العمل المتاح لديك",
                      child: CustomTextFormField(
                        hintText: "اكتب نوع العمل أو المسمّى الوظيفي",
                        textEditingController: vm.titleController,
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
                      ),
                    ),

                    FormSectionField(
                      label: "رقم الهاتف",
                      child: MobileNumberField(
                        controller: vm.phoneController,
                      ),
                    ),

                    FormSectionField(
                      label: "الموقع",
                      child: CustomTextFormField(
                        hintText: "دمشق",
                        keyboardType: TextInputType.text,
                        textEditingController: vm.locationController,
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
                      text: state is AddOpportunityViewModelLoading
                          ? "جاري الإرسال..."
                          : "أضف وظيفة",
                      onPressed: state is AddOpportunityViewModelLoading
                          ? null
                          : () {
                        vm.addOpportunity(
                          job: JobEntity(
                            id: const Uuid().v4(),
                            title: vm.titleController.text.trim(),
                            description: vm.descriptionController.text.trim(),
                            type: "opportunity",
                            phone: vm.phoneController.text.trim(),
                            location: vm.locationController.text.trim(),
                            imageUrl: "",
                            isActive: true,
                            status: "pending",
                    duration: mapDurationToDays(vm.durationController.text),

                          createdAt: DateTime.now(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            /// ----------- FULL PAGE LOADING ----------- ///
            if (state is AddOpportunityViewModelLoading)
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
