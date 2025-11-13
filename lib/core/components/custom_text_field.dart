import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors_manager.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    this.iconShow = false,
    required this.keyboardType,
    this.onSaved,
    this.validator,
    this.isEmailValidator = false,
    this.textEditingController,
    this.autovalidateMode,
    this.prefixIcon,
    this.isEnable = true,
    this.maxLines = 1,    // ← جديد
    this.minLines,        // ← جديد
  });

  final String? hintText;
  final bool iconShow;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool isEmailValidator;
  TextEditingController? textEditingController;
  AutovalidateMode? autovalidateMode;
  Widget? prefixIcon;
  bool isEnable;

  /// NEW
  final int maxLines;
  final int? minLines;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool iconVisible = true;

  @override
  Widget build(BuildContext context) {
    final fillColor =
    widget.isEnable ? ColorsManager.white : Colors.grey.shade300;

    final hintColor =
    widget.isEnable ? Colors.black54 : Colors.grey.shade600;

    return TextFormField(
      enabled: widget.isEnable,
      style: TextStyle(
        color: widget.isEnable ? Colors.black : Colors.grey.shade600,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      autovalidateMode: widget.autovalidateMode,
      controller: widget.textEditingController,

      /// NEW — هنا التحكم بعدد الأسطر
      obscureText: widget.iconShow ? !iconVisible : false,
      maxLines: widget.iconShow ? 1 : widget.maxLines,
      minLines: widget.iconShow ? 1 : widget.minLines,

      onSaved: widget.onSaved,
      validator: widget.isEmailValidator
          ? (value) => widget.validator!(value)
          : (value) {
        if (value == null || value.isEmpty) {
          return "هذا الحقل مطلوب";
        }
        return null;
      },
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        contentPadding: const EdgeInsets.all(16.0),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: hintColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.iconShow
            ? GestureDetector(
          onTap: () {
            setState(() {
              iconVisible = !iconVisible;
            });
          },
          child: Icon(
            iconVisible ? Icons.visibility : Icons.visibility_off,
            color: const Color(0xFFC9CECF),
          ),
        )
            : null,
        border: buildBorder(Colors.grey),
        enabledBorder: buildBorder(Colors.grey),
        focusedBorder: buildBorder(ColorsManager.primaryColor),
        errorBorder: buildBorder(Colors.red),
        focusedErrorBorder: buildBorder(Colors.red),
      ),
    );
  }

  OutlineInputBorder buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color),
    );
  }
}
