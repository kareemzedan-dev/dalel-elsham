import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors_manager.dart';

class AdDurationSelector extends StatefulWidget {
  final Function(String) onSelect;   // يرجع القيمة المختارة

  const AdDurationSelector({super.key, required this.onSelect});

  @override
  State<AdDurationSelector> createState() => _AdDurationSelectorState();
}

class _AdDurationSelectorState extends State<AdDurationSelector> {
  String selected = "أسبوع";

  final List<String> durations = [
    "أسبوع",
    "أسبوعين",
    "شهر",
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12.w,
      children: durations.map((item) {
        final bool isActive = selected == item;

        return GestureDetector(
          onTap: () {
            setState(() {
              selected = item;
            });
            widget.onSelect(item);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isActive ? ColorsManager.primaryColor : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isActive ? ColorsManager.primaryColor : Colors.grey.shade400,
              ),
            ),
            child: Text(
              item,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black87,
                fontSize: 14.sp,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
