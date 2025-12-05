import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/entities/job_entity.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/jobs/add_job_view_model/add_job_view_model.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/jobs/add_job_view_model/add_job_view_model_states.dart';
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

class JobRequestFormViewBody extends StatelessWidget {
  const JobRequestFormViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final vm = context.read<AddJobViewModel>();

    /// 🔍 Validate Duration
    bool validateDuration(BuildContext c) {
      final text = vm.durationController.text.trim();
      if (text.isEmpty) {
        ScaffoldMessenger.of(c).showSnackBar(
          const SnackBar(content: Text("من فضلك اختر مدة الإعلان")),
        );
        return false;
      }
      if (mapDurationToDays(text) <= 0) {
        ScaffoldMessenger.of(c).showSnackBar(
          const SnackBar(content: Text("مدة غير صالحة")),
        );
        return false;
      }
      return true;
    }

    /// 🔥 Submit Job Request
    Future<void> _onSubmit(BuildContext c) async {
      if (!formKey.currentState!.validate()) return;
      if (!validateDuration(c)) return;

      vm.addJob(
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

    return BlocConsumer<AddJobViewModel, AddJobViewModelStates>(
      listener: (context, state) {
        if (state is AddJobViewModelSuccess) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ✔ Icon inside circle
                      Container(
                        width: 70.w,
                        height: 70.w,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check_rounded,
                          size: 40.sp,
                          color: Colors.green,
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // ✔ Title
                      Text(
                        "تم إرسال طلب العمل بنجاح",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 10.h),

                      // ✔ Subtitle
                      Text(
                        "طلبك الآن قيد المراجعة من قبل فريق دليل الشام.\n"
                            "سيتم إعلامك عند الموافقة عليه ونشره.",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 20.h),

                      // ✔ OK Button
                      SizedBox(
                        width: double.infinity,
                        height: 45.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context); // close dialog
                            Navigator.pop(context); // return back
                          },
                          child: Text(
                            "حسنًا",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }


        if (state is AddJobViewModelError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },

      builder: (context, state) {
        final isLoading = state is AddJobViewModelLoading;

        return Stack(
          children: [
            /// ----------- FORM UI -----------
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

                      /// اسم الوظيفة
                      FormSectionField(
                        label: "اسم أو صفة للعمل",
                        child: CustomTextFormField(
                          hintText: "اكتب الاسم أو الصفة المهنية",
                          keyboardType: TextInputType.text,
                          textEditingController: vm.titleController,
                          validator: JobValidators.validateTitle,
                        ),
                      ),

                      /// الوصف
                      FormSectionField(
                        label: "أشرح عن الوظيفة",
                        child: CustomTextFormField(
                          hintText: "اكتب وصفًا مختصرًا عن الوظيفة المطلوبة",
                          keyboardType: TextInputType.text,
                          maxLines: 4,
                          textEditingController: vm.descriptionController,
                          validator: JobValidators.validateDescription,
                        ),
                      ),

                      /// رقم الهاتف
                      FormSectionField(
                        label: "رقم الهاتف",
                        child: MobileNumberField(
                          controller: vm.phoneController,
                          validator: JobValidators.validatePhone,
                        ),
                      ),

                      /// الموقع
                      FormSectionField(
                        label: "الموقع",
                        child: CustomTextFormField(
                          hintText: "دمشق",
                          keyboardType: TextInputType.text,
                          textEditingController: vm.locationController,
                          validator: JobValidators.validateLocation,
                        ),
                      ),

                      /// مدة الإعلان
                      FormSectionField(
                        label: "مدة الإعلان",
                        child: AdDurationSelector(
                          onSelect: (value) {
                            vm.durationController.text = value;
                          },
                        ),
                      ),

                      SizedBox(height: 40.h),

                      /// زر الإرسال
                      CustomButton(
                        text: isLoading ? "جاري الإرسال..." : "إرسال طلب عمل",
                        onPressed: isLoading ? null : () => _onSubmit(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// ----------- LOADING LAYER -----------
            if (isLoading)
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black.withOpacity(0.3),
                child: const Center(child: CircularProgressIndicator()),
              ),
          ],
        );
      },
    );
  }
}
