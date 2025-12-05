import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormSectionField extends StatelessWidget {
  final String label;
  final Widget child;

  const FormSectionField({
    super.key,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          label,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),

        SizedBox(height: 8.h),

        // The input widget (TextField, MobileNumberField, Selector...)
        child,

        SizedBox(height: 20.h),
      ],
    );
  }
}
