import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/colors_manager.dart';

class PrivacyPolicyWithCheck extends FormField<bool> {
  PrivacyPolicyWithCheck({super.key})
      : super(
    initialValue: false,
    validator: (value) {
      if (value == false) {
        return "يجب الموافقة على الشروط والأحكام قبل المتابعة";
      }
      return null;
    },
    builder: (state) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: state.value ?? false,
            activeColor: ColorsManager.primaryColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: BorderSide(
              color: state.hasError ? Colors.red : Colors.grey,
              width: 2,
            ),
            onChanged: (value) {
              state.didChange(value);
            },
          ),
          SizedBox(width: 8.w),
          Flexible( // 👈 بدل Expanded علشان النص يلف مش يوسع المساحة كلها
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "بإنشائك حسابًا فإنك توافق على ",
                    style: Theme.of(state.context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                  ),
                  TextSpan(
                    text: "سياسة الخصوصية ",
                    style: Theme.of(state.context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                      color: ColorsManager.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                  TextSpan(
                    text: "و ",
                    style: Theme.of(state.context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                  ),
                  TextSpan(
                    text: "شروط الاستخدام",
                    style: Theme.of(state.context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                      color: ColorsManager.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.start,
              softWrap: true, // ✅ يسمح بلف النص
            ),
          ),
        ],
      );
    },
  );
}
