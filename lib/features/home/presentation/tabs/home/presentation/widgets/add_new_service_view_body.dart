import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/components/custom_button.dart';
import '../../../../../../../core/components/custom_text_field.dart';
import '../../../../../../../core/components/mobile_number_field.dart';

class AddNewServiceViewBody extends StatelessWidget {
  const AddNewServiceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [

                    CustomTextFormField(
                      hintText: "اسم مشروعك",
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFormField(
                      hintText: "وصف المشروع",
                      maxLines: 6,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 20.h),

                    MobileNumberField(
                      controller: TextEditingController(),
                    ),

                    SizedBox(height: 20.h),
                    CustomTextFormField(
                      hintText: "الموقع",
                      keyboardType: TextInputType.text,
                    ),

                    Spacer(),

                    CustomButton(
                      text: "أضف اعلانك",
                      onPressed: () {},
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
