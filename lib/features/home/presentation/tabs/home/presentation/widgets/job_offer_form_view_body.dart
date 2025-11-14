import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/components/ad_duration_selector.dart';
import '../../../../../../../core/components/custom_button.dart';
import '../../../../../../../core/components/custom_text_field.dart';
import '../../../../../../../core/components/mobile_number_field.dart';
import 'form_section_field.dart';
class JobOfferFormViewBody extends StatelessWidget {
  const JobOfferFormViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                keyboardType: TextInputType.text,
              ),
            ),


            FormSectionField(
              label: "أشرح عن الوظيفة",
              child: CustomTextFormField(
                hintText: "اكتب وصفًا مختصرًا عن الوظيفة المطلوبة",
                keyboardType: TextInputType.text,
                maxLines: 4,
              ),
            ),

            FormSectionField(
              label: "رقم الهاتف",
              child: MobileNumberField(
                controller: TextEditingController(),
              ),
            ),

            FormSectionField(
              label: "الموقع",
              child: CustomTextFormField(
                hintText: "دمشق",
                keyboardType: TextInputType.text,
              ),
            ),

            FormSectionField(
              label: "مدة الإعلان",
              child: AdDurationSelector(
                onSelect: (value) {
                  print("Selected Duration: $value");
                },
              ),
            ),

            SizedBox(height: 40.h),

            CustomButton(
              text: "أضف وظيفه",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}