import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors_manager.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({
    super.key,
    required this.text,
    this.trimLines = 3,
  });

  final String text;
  final int trimLines;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
      
          softWrap: true,
          maxLines: expanded ? null : widget.trimLines,
          overflow:
          expanded ? TextOverflow.visible : TextOverflow.visible,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            height: 1.5,
            fontSize: 12.sp,
          ),
        ),

        if (_isLongText(widget.text))
          GestureDetector(
            onTap: () {
              setState(() => expanded = !expanded);
            },
            child: Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Row(
                children: [

                  Text(
                    expanded ? "عرض أقل" : "عرض المزيد",
                    style: TextStyle(
                      color: ColorsManager.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp,
                    ),
                  ),
                  Icon(
                    expanded
                        ? CupertinoIcons.chevron_up
                        : CupertinoIcons.chevron_down,
                    size: 12.sp,
                    color: ColorsManager.primaryColor,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  bool _isLongText(String text) {
    return text.length > 120; // تقدير بسيط
  }
}
