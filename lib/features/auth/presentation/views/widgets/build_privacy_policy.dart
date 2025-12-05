import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/routes/routes_manager.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../home/presentation/tabs/home/presentation/views/info_page_view.dart';
class PrivacyPolicyWithCheck extends FormField<bool> {
  PrivacyPolicyWithCheck({super.key, required BuildContext context})
      : super(
    initialValue: false,
    validator: (value) {
      if (value == false) {
        return "يجب الموافقة على الشروط والأحكام قبل المتابعة";
      }
      return null;
    },
    builder: (state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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

              // النص القابل للضغط
              Flexible(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "بإنشائك حسابًا فإنك توافق على ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),

                      // -------- سياسة الخصوصية --------
                      TextSpan(
                        text: "سياسة الخصوصية ",
                        style: TextStyle(
                          color: ColorsManager.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const InfoPageView(
                                    pageType: "privacy"),
                              ),
                            );
                          },
                      ),

                      TextSpan(
                        text: "و ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),

                      // -------- شروط الاستخدام --------
                      TextSpan(
                        text: "شروط الاستخدام",
                        style: TextStyle(
                          color: ColorsManager.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const InfoPageView(
                                    pageType: "terms"),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                  softWrap: true,
                ),
              ),
            ],
          ),

          // ----------------- رسالة الخطأ هنا -----------------
          if (state.hasError)
            Padding(
              padding: EdgeInsets.only(top: 4.h, left: 8.w),
              child: Text(
                state.errorText!,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      );
    },
  );
}
