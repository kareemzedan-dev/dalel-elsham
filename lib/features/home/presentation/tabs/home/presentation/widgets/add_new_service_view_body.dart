import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/components/category_dropdown_widget.dart';
import '../../../../../../../core/components/custom_button.dart';
import '../../../../../../../core/components/custom_text_field.dart';
import '../../../../../../../core/components/mobile_number_field.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import 'images_group_box.dart';
import 'logo_picker_box.dart';

class AddNewServiceViewBody extends StatefulWidget {
  const AddNewServiceViewBody({super.key});

  @override
  State<AddNewServiceViewBody> createState() => _AddNewServiceViewBodyState();
}

class _AddNewServiceViewBodyState extends State<AddNewServiceViewBody> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final phoneController = TextEditingController();
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                const LogoPickerBox(),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        hintText: "اسم المشروع",
                        keyboardType: TextInputType.text,
                        textEditingController: titleController,
                      ),
                      SizedBox(height: 12.h),
                      CustomTextFormField(
                        hintText: "وصف المشروع",
                        keyboardType: TextInputType.text,
                        textEditingController: descController,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            CategoryDropdownWidget(
              categories: ["مطاعم", "خدمات", "ترفيه", "تسوق", "تجميل", "صيانة"],
              selectedValue: selectedCategory,
              onChanged: (value) => setState(() => selectedCategory = value),
            ),

            SizedBox(height: 20.h),

            CustomTextFormField(
              hintText: "الموقع",
              keyboardType: TextInputType.text,
            ),

            SizedBox(height: 20.h),

            MobileNumberField(

              controller: phoneController,
              hintText: "اتصال + واتس اب",
            ),

            SizedBox(height: 20.h),

            Text(
              "اختياري (اضف صور خاصه بمشروعك)",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: ColorsManager.black.withOpacity(0.5),
              ),
            ),

            SizedBox(height: 8.h),

            const ImagesGroupBox(),

            SizedBox(height: 60.h),

            CustomButton(
              text: "أضف اعلانك",
              onPressed: () {},
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
